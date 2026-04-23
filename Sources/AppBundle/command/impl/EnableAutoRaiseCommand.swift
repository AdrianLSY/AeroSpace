import AppKit
import Common

struct EnableAutoRaiseCommand: Command {
    let args: EnableAutoRaiseCmdArgs
    /*conforms*/ let shouldResetClosedWindowsCache = false

    func run(_ env: CmdEnv, _ io: CmdIo) async throws -> BinaryExitCode {
        if AutoRaiseController.isEnabled {
            switch args.failIfNoop {
                case true: return .fail
                case false:
                    return .succ(io.err("auto-raise is already enabled. Tip: use --fail-if-noop to exit with non-zero code"))
            }
        }
        AutoRaiseController.start(config: config.autoRaise)
        return .succ
    }
}
