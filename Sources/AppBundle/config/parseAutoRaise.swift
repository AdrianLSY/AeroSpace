import Common
import Foundation

private let autoRaiseParser: [String: any ParserProtocol<AutoRaiseConfig>] = [
    "enabled": Parser(\.enabled, parseBool),
    "poll-millis": Parser(\.pollMillis, parsePollMillis),
    "ignore-space-changed": Parser(\.ignoreSpaceChanged, parseBool),
    "invert-disable-key": Parser(\.invertDisableKey, parseBool),
    "invert-ignore-apps": Parser(\.invertIgnoreApps, parseBool),
    "ignore-apps": Parser(\.ignoreApps, parseArrayOfStrings),
    "ignore-titles": Parser(\.ignoreTitles, parseIgnoreTitles),
    "stay-focused-bundle-ids": Parser(\.stayFocusedBundleIds, parseArrayOfStrings),
    "disable-key": Parser(\.disableKey, parseAutoRaiseDisableKey),
]

func parseAutoRaise(_ raw: OrderedJson, _ backtrace: ConfigBacktrace, _ c: inout ConfigParserContext) -> AutoRaiseConfig {
    parseTable(raw, AutoRaiseConfig(), autoRaiseParser, backtrace, &c)
}

private func parsePollMillis(_ raw: OrderedJson, _ backtrace: ConfigBacktrace) -> ResOrConfigParseDiagnostic<Int> {
    parseInt(raw, backtrace).filter(ConfigParseDiagnostic(backtrace, "Must be >= 1")) { $0 >= 1 }
}

private func parseAutoRaiseDisableKey(_ raw: OrderedJson, _ backtrace: ConfigBacktrace) -> ResOrConfigParseDiagnostic<AutoRaiseDisableKey> {
    parseString(raw, backtrace).flatMap {
        AutoRaiseDisableKey(rawValue: $0).toResult(
            ConfigParseDiagnostic(backtrace, "Can't parse disable-key '\($0)'. Allowed values: control, option, disabled"),
        )
    }
}

// ICU regex validation. NSRegularExpression uses ICU internally, matching the
// regex engine used by AutoRaise.mm's `rangeOfString:options:NSRegularExpressionSearch`.
private func parseIgnoreTitles(_ raw: OrderedJson, _ backtrace: ConfigBacktrace) -> ResOrConfigParseDiagnostic<[String]> {
    parseArrayOfStrings(raw, backtrace).flatMap { patterns in
        for (i, pattern) in patterns.enumerated() {
            do {
                _ = try NSRegularExpression(pattern: pattern, options: [])
            } catch {
                return .failure(ConfigParseDiagnostic(
                    backtrace + .index(i),
                    "Invalid regex '\(pattern)': \(error.localizedDescription)",
                ))
            }
        }
        return .success(patterns)
    }
}
