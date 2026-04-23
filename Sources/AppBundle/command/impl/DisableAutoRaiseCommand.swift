import AppKit
import Common

struct DisableAutoRaiseCommand: Command {
    let args: DisableAutoRaiseCmdArgs
    /*conforms*/ let shouldResetClosedWindowsCache = false

    func run(_ env: CmdEnv, _ io: CmdIo) async throws -> BinaryExitCode {
        if !AutoRaiseController.isEnabled {
            switch args.failIfNoop {
                case true: return .fail
                case false:
                    return .succ(io.err("auto-raise is already disabled. Tip: use --fail-if-noop to exit with non-zero code"))
            }
        }
        AutoRaiseController.stop()
        return .succ
    }
}
