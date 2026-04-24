# Spec: auto-raise

## ADDED Requirements

### Requirement: Hover-raise within current workspace

When the mouse cursor crosses the boundary of a window belonging to the currently-focused workspace, AeroSpace SHALL raise and focus that window, routing the focus change through `setFocus(to:)` so the AeroSpace tree model, monitor active-workspace state, and `on-focus-changed` callbacks remain consistent.

#### Scenario: Cursor enters a window on the focused workspace

- **Given** auto-raise is enabled
- **And** workspace `A` is focused on the current monitor
- **And** windows `W1` and `W2` both belong to workspace `A`
- **And** `W1` is currently focused
- **When** the mouse cursor crosses into `W2`
- **Then** `W2` becomes the focused window
- **And** AeroSpace's `_focus` state and the tree's most-recent-child pointer update to `W2`
- **And** `on-focus-changed` user callbacks fire

#### Scenario: Cursor enters a window on a different workspace

- **Given** auto-raise is enabled
- **And** workspace `A` is focused
- **And** window `W3` belongs to workspace `B` but is visually present on screen (e.g. on another monitor)
- **When** the mouse cursor crosses into `W3`
- **Then** focus does not change
- **And** AeroSpace does not switch workspaces

### Requirement: Raise on space change

When the macOS active space changes and `ignore-space-changed` is false, AeroSpace SHALL re-evaluate the window under the cursor and raise it if it differs from the currently-focused window, using the same current-workspace-only rule as hover-raise.

#### Scenario: Space change brings a different window under the cursor

- **Given** auto-raise is enabled and `ignore-space-changed = false`
- **When** the user switches macOS spaces via a gesture or external tool
- **And** a window on the new space lies under the current cursor position
- **And** that window belongs to the now-focused AeroSpace workspace
- **Then** that window becomes focused without requiring further mouse movement

### Requirement: Temporary disable via modifier key

While the configured `disable-key` modifier is held, AeroSpace SHALL suppress all hover-raise actions. When `invert-disable-key = true`, the behavior is inverted: hover-raise only operates while the modifier is held.

#### Scenario: Holding disable-key suppresses raise

- **Given** auto-raise is enabled with `disable-key = "control"` and `invert-disable-key = false`
- **And** the user is holding the `control` key
- **When** the mouse cursor crosses into a different window on the current workspace
- **Then** focus does not change
- **When** the user releases `control`
- **And** the cursor moves into a new window
- **Then** that window becomes focused

### Requirement: App and title ignore-lists

AeroSpace SHALL not hover-raise windows whose owning application's name is in `ignore-apps`, nor windows whose title matches any regex in `ignore-titles`. When `invert-ignore-apps = true`, `ignore-apps` is interpreted as an allow-list (only those apps participate in hover-raise).

#### Scenario: Hover a window from an ignored app

- **Given** auto-raise is enabled with `ignore-apps = ["Finder"]` and `invert-ignore-apps = false`
- **When** the cursor enters a Finder window
- **Then** focus does not change

### Requirement: Stay-focused bundle IDs

AeroSpace SHALL not hover-raise away from any window whose application bundle ID is in `stay-focused-bundle-ids`. Such an app, once focused, remains focused until the user changes focus via another mechanism (click, command, keybinding).

#### Scenario: Sticky focus for a security-sensitive dialog

- **Given** auto-raise is enabled with `stay-focused-bundle-ids = ["com.apple.SecurityAgent"]`
- **And** a SecurityAgent dialog is focused
- **When** the cursor moves onto a different window
- **Then** focus stays on the SecurityAgent dialog

### Requirement: Runtime toggle commands

AeroSpace SHALL provide `enable-auto-raise` and `disable-auto-raise` commands that start and stop hover-raise at runtime. Runtime state takes precedence over config-file state — a config reload does not override a runtime toggle.

#### Scenario: Disable at runtime persists across config reload

- **Given** auto-raise is enabled in the config file and currently running
- **When** the user runs `aerospace disable-auto-raise`
- **Then** hover-raise stops
- **When** the config file is touched (triggering `ConfigFileWatcher`)
- **Then** hover-raise remains stopped

#### Scenario: Commands are idempotent

- **Given** auto-raise is already running
- **When** the user runs `aerospace enable-auto-raise`
- **Then** the command succeeds without error and no state changes
- **Given** auto-raise is already stopped
- **When** the user runs `aerospace disable-auto-raise`
- **Then** the command succeeds without error

### Requirement: Config schema

AeroSpace SHALL accept the following TOML section in the aerospace config:

```toml
[auto-raise]
enabled = true                         # default: false
poll-millis = 8                        # default: 8, min: 1
ignore-space-changed = false           # default: false
invert-disable-key = false             # default: false
invert-ignore-apps = false             # default: false
ignore-apps = ["App1", "App2"]         # default: []
ignore-titles = ["^window$"]           # default: [] — ICU regex
stay-focused-bundle-ids = ["com.x"]    # default: []
disable-key = "control"                # default: "control"; values: "control"|"option"|"disabled"
```

Validation: `poll-millis >= 1`; `disable-key` must be one of the three string values; each entry in `ignore-titles` must compile as an ICU regex; unknown keys produce a config error.

#### Scenario: Invalid poll-millis

- **Given** a config with `[auto-raise] poll-millis = 0`
- **When** AeroSpace parses the config
- **Then** a config error is reported and the config is rejected

#### Scenario: Invalid disable-key value

- **Given** a config with `[auto-raise] disable-key = "shift"`
- **When** AeroSpace parses the config
- **Then** a config error is reported listing the allowed values

### Requirement: Single-process integration

AeroSpace's AutoRaise integration SHALL run in the same process as the rest of AppBundle. No separate AutoRaise binary or helper process is launched.

#### Scenario: One Accessibility permission

- **Given** a fresh install of AeroSpace with auto-raise enabled in config
- **When** the user grants Accessibility permission to AeroSpace
- **Then** hover-raise works without any additional permission prompt

### Requirement: Cmd-tab mouse warp is not provided

AeroSpace's AutoRaise integration SHALL NOT implement mouse warping on app activation, cursor-scale animation, or the `altTaskSwitcher`/`warpX`/`warpY`/`scale` options present in upstream AutoRaise. Users wanting mouse-follows-focus behavior can compose AeroSpace's existing `move-mouse` command with `on-focus-changed` callbacks.

#### Scenario: Unknown keys (including upstream-only AutoRaise options) are rejected

- **Given** a config containing an unknown key under `[auto-raise]` — for example `altTaskSwitcher = true` (an upstream-only option that isn't part of the AeroSpace schema)
- **When** AeroSpace parses the config
- **Then** a config error is reported indicating the key is unknown (`auto-raise.<key>: Unknown key`)
