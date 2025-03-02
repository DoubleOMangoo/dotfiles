-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

config.color_scheme = 'Mangooscheme'
config.color_schemes = {
  ['Mangooscheme'] = {
    background = "#1c1431"
  }
}
config.max_fps = 120
config.default_prog = { "powershell.exe"}
--config.color_scheme = "Tokyo Night Moon"
-- and finally, return the configuration to wezterm
return config
