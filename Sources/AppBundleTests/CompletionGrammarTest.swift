@testable import AppBundle
@testable import Common
import Foundation
import XCTest

/// `grammar/commands-bnf-grammar.txt` is hand-maintained and feeds
/// `./build-shell-completion.sh`. Nothing else validates it, so it silently
/// drifts from `Sources/Common/cmdArgs/` whenever a flag is added, renamed or
/// removed — completion then either hides a real flag or suggests one that
/// always fails to parse.
///
/// Scope: this compares *flag sets per subcommand*, unioned across all of that
/// subcommand's productions. It deliberately does not try to model which flags
/// are legal in which production — that depends on `conflictingOptions` and on
/// the `.filter` rules in each `parse*CmdArgs`, and complgen cannot express
/// most of it anyway. So a flag that is valid on one form but wrongly offered
/// on another still slips through; only wholly-absent and wholly-bogus flags
/// are caught.
final class CompletionGrammarTest: XCTestCase {
    /// Deprecated aliases are deliberately absent from the grammar: completion
    /// should not steer anyone towards a name that is on its way out.
    private static let notInGrammarOnPurpose: Set<String> = ["move-through", "move-workspace-to-display"]

    func testEveryGrammarFlagIsAcceptedByTheParser() throws {
        let grammar = try Grammar.load()
        var problems: [String] = []
        for (command, flags) in grammar.flagsByCommand.sorted(by: { $0.key < $1.key }) {
            guard let declared = declaredFlags(of: command) else { continue }
            for flag in flags.subtracting(declared).sorted() {
                problems.append("\(command): grammar offers \(flag), which \(command) does not accept")
            }
        }
        assertNoProblems(problems, hint: "Completion would suggest a flag that always fails to parse.")
    }

    func testEveryParserFlagIsOfferedByTheGrammar() throws {
        let grammar = try Grammar.load()
        var problems: [String] = []
        for (command, parser) in subcommandParsers.sorted(by: { $0.key < $1.key }) {
            if Self.notInGrammarOnPurpose.contains(command) { continue }
            guard let offered = grammar.flagsByCommand[command] else {
                problems.append("\(command): missing from the grammar entirely")
                continue
            }
            for flag in parser.declaredFlagKeys.subtracting(offered).sorted() {
                problems.append("\(command): parser accepts \(flag), which the grammar never offers")
            }
        }
        assertNoProblems(problems, hint: "Completion would hide a real flag.")
    }

    func testGrammarDoesNotDescribeUnknownCommands() throws {
        let grammar = try Grammar.load()
        let problems = grammar.flagsByCommand.keys
            .filter { subcommandParsers[$0] == nil }
            .sorted()
            .map { "\($0): described by the grammar but not registered in initSubcommands()" }
        assertNoProblems(problems, hint: "Completion would offer a subcommand that does not exist.")
    }

    private func declaredFlags(of command: String) -> Set<String>? {
        subcommandParsers[command]?.declaredFlagKeys
    }

    private func assertNoProblems(_ problems: [String], hint: String, file: StaticString = #filePath, line: UInt = #line) {
        if problems.isEmpty { return }
        XCTFail(
            """
            \(hint)
            Fix grammar/commands-bnf-grammar.txt (or the parser) so the two agree:
            \(problems.map { "  - " + $0 }.joined(separator: "\n"))
            """,
            file: file,
            line: line,
        )
    }
}

extension SubCommandParserProtocol {
    /// Reachable on `any SubCommandParserProtocol` because the result type does
    /// not mention the associated type.
    var declaredFlagKeys: Set<String> { Set(T.parser.flags.keys) }
}

/// Just enough of complgen's dialect to recover, per subcommand, the set of
/// long flags the grammar offers.
private struct Grammar {
    let flagsByCommand: [String: Set<String>]

    static func load() throws -> Grammar {
        let text = try String(contentsOf: url, encoding: .utf8)
        let rules = Self.rules(in: text)
        guard let subcommands = rules["<subcommand>"] else {
            throw Failure("<subcommand> rule not found in \(url.path)")
        }
        var flagsByCommand: [String: Set<String>] = [:]
        for alternative in Self.splitOnTopLevelPipes(subcommands) {
            let tokens = Self.tokenize(alternative)
            guard let command = tokens.first, !command.hasPrefix("-"), !command.hasPrefix("<") else { continue }
            let flags = Self.flags(in: tokens.dropFirst(), rules: rules, visiting: [])
            flagsByCommand[command, default: []].formUnion(flags)
        }
        return Grammar(flagsByCommand: flagsByCommand)
    }

    static var url: URL {
        // <repo>/Sources/AppBundleTests/CompletionGrammarTest.swift
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("grammar/commands-bnf-grammar.txt")
    }

    /// `<name> ::= body;` plus the bare `aerospace ...;` rules, which we ignore.
    private static func rules(in text: String) -> [String: String] {
        var result: [String: String] = [:]
        for statement in stripShellBlocks(stripComments(text)).components(separatedBy: ";") {
            let parts = statement.components(separatedBy: "::=")
            guard parts.count == 2 else { continue }
            let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
            result[name] = parts[1]
        }
        return result
    }

    private static func stripComments(_ text: String) -> String {
        text.split(separator: "\n", omittingEmptySubsequences: false)
            .filter { !$0.trimmingCharacters(in: .whitespaces).hasPrefix("#") }
            .joined(separator: "\n")
    }

    /// `{{{ ... }}}` holds a shell command, which may itself contain `|` and
    /// `--flags` that have nothing to do with the aerospace CLI.
    private static func stripShellBlocks(_ text: String) -> String {
        var result = ""
        var rest = Substring(text)
        while let open = rest.range(of: "{{{") {
            result += rest[..<open.lowerBound]
            guard let close = rest.range(of: "}}}", range: open.upperBound ..< rest.endIndex) else { return result }
            result += " SHELL "
            rest = rest[close.upperBound...]
        }
        return result + rest
    }

    private static func splitOnTopLevelPipes(_ body: String) -> [String] {
        var alternatives: [String] = []
        var current = ""
        var depth = 0
        for char in body {
            switch char {
                case "[", "(": depth += 1; current.append(char)
                case "]", ")": depth -= 1; current.append(char)
                case "|" where depth == 0: alternatives.append(current); current = ""
                default: current.append(char)
            }
        }
        alternatives.append(current)
        return alternatives.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    }

    /// Grammar punctuation binds directly to the tokens it decorates
    /// (`[--no-gui`, `--warnings-as-errors]...`), so it has to be split off
    /// rather than trimmed.
    private static func tokenize(_ text: String) -> [String] {
        let separators = CharacterSet(charactersIn: "[]()|.").union(.whitespacesAndNewlines)
        return text.components(separatedBy: separators).filter { !$0.isEmpty }
    }

    private static func flags(in tokens: some Sequence<String>, rules: [String: String], visiting: Set<String>) -> Set<String> {
        var result: Set<String> = []
        for token in tokens {
            if token.hasPrefix("--"), token.count > 2 {
                result.insert(token)
            } else if token.hasPrefix("<"), token.hasSuffix(">"), !visiting.contains(token), let body = rules[token] {
                result.formUnion(flags(in: tokenize(body), rules: rules, visiting: visiting.union([token])))
            }
        }
        return result
    }

    struct Failure: Error, CustomStringConvertible {
        let description: String
        init(_ description: String) { self.description = description }
    }
}
