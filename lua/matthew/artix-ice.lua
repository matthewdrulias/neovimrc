-- Artix Ice colorscheme for Neovim
-- Ported from Ghostty theme

local M = {}

M.setup = function()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "artix-ice"

	-- Palette from Ghostty Artix-Ice theme
	local colors = {
		-- Terminal colors (palette 0-15)
		black = "#000000",          -- palette 0
		red = "#FB3048",            -- palette 1
		green = "#A6F7CC",          -- palette 2
		yellow = "#F6E2A7",         -- palette 3
		blue = "#21AAD2",           -- palette 4
		magenta = "#F07178",        -- palette 5
		cyan = "#5DF4FE",           -- palette 6
		white = "#fcfcfc",          -- palette 7
		bright_black = "#666666",   -- palette 8
		bright_red = "#FB3048",     -- palette 9
		bright_green = "#A6F7CC",   -- palette 10
		bright_yellow = "#F6E2A7",  -- palette 11
		bright_blue = "#21AAD2",    -- palette 12
		bright_magenta = "#F07178", -- palette 13
		bright_cyan = "#5DF4FE",    -- palette 14
		bright_white = "#fcfcfc",   -- palette 15

		-- UI colors
		bg = "#0F0F0F",
		fg = "#fcfcfc",
		cursor = "#fcfcfc",
		cursor_text = "#0F0F0F",
		selection_bg = "#FCFCFC",
		selection_fg = "#000000",
	}

	-- Helper function to set highlight
	local function hi(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- Editor UI
	hi("Normal", { fg = colors.fg, bg = "none" })
	hi("NormalFloat", { fg = colors.fg, bg = "none" })
	hi("Cursor", { fg = colors.cursor_text, bg = colors.cursor })
	hi("Visual", { fg = colors.selection_fg, bg = colors.selection_bg })
	hi("CursorLine", { bg = colors.green, fg = colors.black })
	hi("LineNr", { fg = colors.bright_black })
	hi("CursorLineNr", { fg = colors.cyan, bold = true })
	hi("SignColumn", { bg = "none" })
	hi("VertSplit", { fg = colors.bright_black })
	hi("Pmenu", { fg = colors.fg, bg = colors.bright_black })
	hi("PmenuSel", { fg = colors.black, bg = colors.cyan })
	hi("StatusLine", { fg = colors.fg, bg = colors.bright_black })
	hi("StatusLineNC", { fg = colors.bright_black, bg = colors.black })

	-- Syntax highlighting
	hi("Comment", { fg = colors.bright_black, italic = false })
	hi("Constant", { fg = colors.magenta })
	hi("String", { fg = colors.green })
	hi("Character", { fg = colors.green })
	hi("Number", { fg = colors.magenta })
	hi("Boolean", { fg = colors.magenta })
	hi("Float", { fg = colors.magenta })
	hi("Identifier", { fg = colors.blue })
	hi("Function", { fg = colors.yellow })
	hi("Statement", { fg = colors.red })
	hi("Conditional", { fg = colors.red })
	hi("Repeat", { fg = colors.red })
	hi("Label", { fg = colors.red })
	hi("Operator", { fg = colors.cyan })
	hi("Keyword", { fg = colors.red, italic = false })
	hi("Exception", { fg = colors.red })
	hi("PreProc", { fg = colors.cyan })
	hi("Include", { fg = colors.cyan })
	hi("Define", { fg = colors.cyan })
	hi("Macro", { fg = colors.cyan })
	hi("Type", { fg = colors.blue })
	hi("StorageClass", { fg = colors.blue })
	hi("Structure", { fg = colors.blue })
	hi("Special", { fg = colors.cyan })
	hi("SpecialChar", { fg = colors.cyan })
	hi("Tag", { fg = colors.red })
	hi("Delimiter", { fg = colors.fg })
	hi("SpecialComment", { fg = colors.bright_black })
	hi("Debug", { fg = colors.red })
	hi("Underlined", { underline = true })
	hi("Error", { fg = colors.red, bg = "none", bold = true })
	hi("Todo", { fg = colors.yellow, bg = "none", bold = true })

	-- Telescope transparency
	hi("TelescopeNormal", { bg = "none" })
	hi("TelescopeBorder", { bg = "none" })
	hi("TelescopePromptNormal", { bg = "none" })
	hi("TelescopePromptBorder", { bg = "none" })
	hi("TelescopeResultsNormal", { bg = "none" })
	hi("TelescopeResultsBorder", { bg = "none" })
	hi("TelescopePreviewNormal", { bg = "none" })
	hi("TelescopePreviewBorder", { bg = "none" })

	-- LSP/Diagnostic
	hi("DiagnosticError", { fg = colors.red })
	hi("DiagnosticWarn", { fg = colors.yellow })
	hi("DiagnosticInfo", { fg = colors.blue })
	hi("DiagnosticHint", { fg = colors.cyan })
end

return M
