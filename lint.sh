#!/usr/bin/env bash
cd "$(dirname "$0")"
source ./script/setup.sh

./format.sh "$@"

if sw_vers -productVersion | grep -q "^14"; then # macOS 14
    # dyld[6263]: Library not loaded: /usr/lib/swift/libswiftSynchronization.dylib
    # Referenced from: <0A48220F-3DCA-3C6C-A54C-FE6C3B854E23> /Users/runner/work/AeroSpace/AeroSpace/.deps/periphery/dist/periphery-3.6.0.artifactbundle/periphery-3.6.0-macos/bin/periphery (built for macOS 15.0 which is newer than running OS)
    # Reason: tried: '/usr/lib/swift/libswiftSynchronization.dylib' (no such file), '/System/Volumes/Preboot/Cryptexes/OS/usr/lib/swift/libswiftSynchronization.dylib' (no such file), '/usr/lib/swift/libswiftSynchronization.dylib' (no such file, not in dyld cache)
    echo 'warning: periphery is disabled on macos 14'
elif sw_vers -productVersion | grep -q "^26"; then # macOS 26 (Tahoe) / Xcode 26 / Swift 6.3
    # periphery 3.7.2 fails --strict with "Unknown extended reference kind
    # for extension 'extension'" after AutoRaiseCore (ObjC++) was added to
    # the project. Tracked upstream at
    # https://github.com/peripheryapp/periphery/issues/1105 ; no workaround
    # or fix released yet. Remove this skip once a periphery release ships
    # a fix for the SwiftSyntax / mixed-language issue.
    echo 'warning: periphery is disabled on macos 26 pending peripheryapp/periphery#1105'
else
    ./script/install-dep.sh --periphery
    # Disable superfluous comments detection because it's buggy. todo: report to periphery maintainer
    ./.deps/periphery/periphery scan --quiet \
        --strict \
        --disable-redundant-public-analysis \
        --no-superfluous-ignore-comments \
        --exclude-targets ShellParserGenerated
fi
