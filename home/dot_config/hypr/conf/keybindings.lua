-- Keybindings Configuration

local mainMod = "SUPER"
local HYPRSCRIPTS = os.getenv("HOME") .. "/.config/hypr/scripts"
local ipc = "qs -c noctalia-shell ipc call"

-- 1. Applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"), { description = "Open the terminal" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"), { description = "Open the browser" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus --new-window"), { description = "Open the filemanager" })

-- 2. Display
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(awk \"BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}\")"), { description = "Increase display zoom" })
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(awk \"BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}\")"), { description = "Decrease display zoom" })
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"), { description = "Reset display zoom" })

-- 3. Windows
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Kill active window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"), { description = "Quit active window and all open instances" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ fake = false }), { description = "Set active window to fullscreen" })
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ fake = true }), { description = "Maximize Window" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle active windows into floating mode" })
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("hyprctl keyword workspace allfloat toggle"), { description = "Toggle all windows into floating mode" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Move focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Move focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Move focus down" })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Move window with the mouse" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize window with the mouse" })

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true }, { description = "Increase window width with keyboard" })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true }, { description = "Reduce window width with keyboard" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true }, { description = "Increase window height with keyboard" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true }, { description = "Reduce window height with keyboard" })

hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "Toggle window group" })
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"), { description = "Swapsplit" })

hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "left" }), { description = "Swap tiled window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "right" }), { description = "Swap tiled window right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "up" }), { description = "Swap tiled window up" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "down" }), { description = "Swap tiled window down" })

-- hl.bind(mainMod .. " + ALT + Tab", hl.dsp.focus({ cycle = "next" }), { description = "Cycle between windows" })

-- 3. Actions
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload Hyprland configuration" })
hl.bind(mainMod .. " + SUPER + P", hl.dsp.exec_cmd("grimblast save active"), { description = "Take a screenshot of the active window" })
hl.bind(mainMod .. " + SUPER + SHIFT + P", hl.dsp.exec_cmd("grimblast save area"), { description = "Take a screenshot of an area" })
hl.bind(mainMod .. " + SUPER + ALT + P", hl.dsp.exec_cmd("grimblast save output"), { description = "Take a screenshot of the current output" })
hl.bind(mainMod .. " + SUPER + CTRL + P", hl.dsp.exec_cmd("grimblast save screen"), { description = "Take a screenshot of the entire screen" })
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd(ipc .. " wallpaper toggle"), { description = "Open wallpaper selector" })
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd(ipc .. " launcher toggle"), { description = "Open launcher" })
hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd(ipc .. " plugin:keybind-cheatsheet toggle"), { description = "Open keybind cheatsheet" })
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd(ipc .. " launcher clipboard"), { description = "Open clipboard menu" })
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd(ipc .. " settings toggle"), { description = "Open Noctalia settings" })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"), { description = "Open session menu" })

-- 4. Workspaces
for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Open workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move active window to workspace " .. i })
end

hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "m+1" }), { description = "Open next workspace" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }), { description = "Open previous workspace" })

for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + CTRL +" .. key, hl.dsp.exec_cmd(HYPRSCRIPTS .. "/moveToWorkspace.sh " .. i), { description = "Move all windows to workspace " .. i })
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Open next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Open previous workspace" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.focus({ workspace = "empty" }), { description = "Open the next empty workspace" })

-- 5. Function Keys
hl.bind(mainMod .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q s +10%"), { description = "Increase brightness by 10%" })
hl.bind(mainMod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q s 10%-"), { description = "Reduce brightness by 10%" })
hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { description = "Increase volume by 5%" })
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { description = "Reduce volume by 5%" })
hl.bind(mainMod .. " + XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { description = "Toggle mute" })
hl.bind(mainMod .. " + XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Audio play pause" })
hl.bind(mainMod .. " + XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), { description = "Audio pause" })
hl.bind(mainMod .. " + XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Audio next" })
hl.bind(mainMod .. " + XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Audio previous" })
hl.bind(mainMod .. " + XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { description = "Toggle microphone" })
-- hl.bind(mainMod .. " + XF86Lock", hl.dsp.exec_cmd("hyprlock"), { description = "Open screenlock" })