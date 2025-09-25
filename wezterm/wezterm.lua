-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Settings
config.color_scheme = "Mangooscheme"
config.color_schemes = {
	["Mangooscheme"] = {
		background = "#1c1431",
	},
}
config.max_fps = 120
config.default_prog = { "powershell.exe" }
config.tab_bar_at_bottom = true

-- Keys
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "c", mods = "LEADER", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },

	-- Pane keybindings

	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = ";", mods = "LEADER", action = act.PaneSelect },
	{ key = "g", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain", args = { 'lazygit' } }) },
	{ key = "y", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain", args = { 'yazi' } }) },

	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	--Tab keybindings
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "a", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "DOMAINS" }) },

	-- Workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Leader key indicator
wezterm.on("update-right-status", function(window, _)
		local SOLID_LEFT_ARROW = ""
		local ARROW_FOREGROUND = {Foreground = {Color = "#c6a0f6"}}
		local prefix = ""

		if window:leader_is_active() then
			prefix = " " .. utf8.char(0x1f30a)
			SOLID_LEFT_ARROW = utf8.char(0xe0b2)
		end

		if window:active_tab():tab_id() ~0 then
			ARROW_FOREGROUND = {Foreground = {Color = "#1e2030"}}
		end

		window:set_left_status(wezterm.format {
			{Background = {Color = "#b7bdf8"}},
			{Text = prefix},
			ARROW_FOREGROUND,
			{Text = SOLID_LEFT_ARROW}
		})
	end
)
-- and finally, return the configuration to wezterm
return config
