-- Hyprland Lua Configuration
-- Main entry point that loads all configuration modules

-- Core Configuration
require("conf.monitors")
require("conf.cursor")
require("conf.environment")
require("conf.keyboard")

-- Colors and Appearance
require("conf.noctalia")
require("conf.windows")
require("conf.decoration")
require("conf.animations")

-- Layout and Workspace
require("conf.layout")
require("conf.workspace")

-- Utilities
require("conf.misc")
require("conf.autostart")

-- Input/Interactions
require("conf.keybindings")
require("conf.windowrules")
