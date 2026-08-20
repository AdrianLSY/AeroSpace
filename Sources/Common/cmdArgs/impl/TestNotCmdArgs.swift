public struct TestNotCmdArgs: CmdArgs {
    /*conforms*/ public var commonState: CmdArgsCommonState
    public init(rawArgs: StrArrSlice) { self.commonState = .init(rawArgs) }
    public static let parser: CmdParser<Self> = .init(
        kind: .testNot,
        help: test_not_help_generated,
        flags: [:],
        posArgs: [],
    )
    public typealias ExitCodeType = ConditionalExitCode

    public var testArgs = TestCmdArgs(rawArgs: [])
}

func parseTestNotCmdArgs(_ args: StrArrSlice) -> ParsedCmd<TestNotCmdArgs> {
    // test-not borrows TestCmdArgs to parse its operands, so parseSpecificCmdArgs
    // sees T == TestCmdArgs and would answer -h/--help with test's usage.
    return switch parseSpecificCmdArgs(TestCmdArgs(rawArgs: args), args) {
        case .cmd(let testArgs): .cmd(TestNotCmdArgs(rawArgs: args).copy(\.testArgs, testArgs))
        case .help: .help(TestNotCmdArgs.info.help)
        case .failure(let failure): .failure(failure)
    }
}
