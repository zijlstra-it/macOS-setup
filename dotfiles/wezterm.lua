local wezterm = require("wezterm")
local act = wezterm.action

return {
	default_prog = { "/bin/zsh", "-l" },
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",

	color_scheme = "tokyonight",
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
	font_size = 13,
	line_height = 1.0,

	use_dead_keys = false,
	scrollback_lines = 10000,

	-- Window
	window_frame = {
		active_titlebar_bg = "#090909",
		border_left_width = "0.15cell",
		border_right_width = "0.15cell",
		border_bottom_height = "0.1cell",
		border_top_height = "0.1cell",
		border_left_color = "grey",
		border_right_color = "grey",
		border_bottom_color = "grey",
		border_top_color = "grey",
	},
	window_padding = {
		left = 5,
		right = 10,
		top = 0,
		bottom = 0,
	},
	window_close_confirmation = "NeverPrompt",
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.5,
	},
	adjust_window_size_when_changing_font_size = false,

	-- Scrollbar
	enable_scroll_bar = true,

	-- Tab bar
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	show_tab_index_in_tab_bar = true,
	switch_to_last_active_tab_when_closing_tab = true,
	show_new_tab_button_in_tab_bar = false,

	-- Colors
	colors = {
		tab_bar = {

			active_tab = {
				bg_color = "#1a1b26",
				fg_color = "#c0c0c0",
				intensity = "Half",
			},

			inactive_tab = {
				bg_color = "black",
				fg_color = "#808080",
				intensity = "Half",
			},
		},
	},

	-- Mouse settings
	pane_focus_follows_mouse = true,

	-- Keybindings
	keys = {
		{ key = "-", mods = "CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{
			key = ",",
			mods = "CMD",
			action = act.SpawnCommandInNewTab({
				cwd = os.getenv("WEZTERM_CONFIG_DIR"),
				set_environment_variables = {
					TERM = "screen-256color",
				},
				args = {
					"/usr/local/opt/neovim/bin/nvim",
					os.getenv("WEZTERM_CONFIG_FILE"),
				},
			}),
		},
	},
}
