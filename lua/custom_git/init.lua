local M = {}

local colors = {
    bg = '#ffffff',
    fg_dark = '#666666',
    fg_gutter = '#babbbd',
    fg_light = '#586069',
    fg= '#24292f',
    bg_highlight = '#d5e5f6',
    bg_search = '#fff2be',
    bg_visual = '#e1e4e8',
    bg_visual_selection = '#dbe9f9',
    border = '#044289',
    cursor = '#044289',
    cursor_line_nr = '#24292e',
    line_nr = '#babbbd',
    error = '#cb2431',
    warning = '#bf8803',
    info = '#75beff',
    hint = '#6c6c6c',
    lsp_ref_txt = '#c6eed2', 
    comment = '#6a737d',
    constant = '#005cc5',
    string = '#032f62',
    variable = '#953800',
    keyword = '#AC5E00',
    func = '#6f42c1',
    func_param = '#24292e',
    match_paren_bg = '#c6eed2',
    param = '#e36209',
    json_label = '#005cc5',
		git_add = '#28a745', 
		git_change = '#2188ff', 
		git_delete = '#d73a49' ,
		diff_add = '#d4f8db',
    diff_add_fg = '#22863a',
    diff_change = '#fff5b1',
    diff_change_fg = '#b08800',
    diff_delete = '#fae5e7',
    diff_delete_fg = '#cb2431',
    pmenu_bg = '#f6f8fa',
		pmenu_sbar = '#f0f1f3',
		orange = '#d18616',
    black = '#24292e',
    bright_black = '#959da5',
    white = '#6a737d',
    bright_white = '#d1d5da',
    red = '#d73a49',
    bright_red = '#cb2431',
    green = '#28a745',
    bright_green = '#22863a',
    yellow = '#dbab09',
    bright_yellow = '#b08800',
    blue = '#0366d6',
    bright_blue = '#005cc5',
    magenta = '#5a32a3',
    bright_magenta = '#5a32a3',
    cyan = '#0598bc',
    bright_cyan = '#3192aa',
}


local highlights = {
  -- Syntax Groups (descriptions and ordering from `:h w18`)
  { hg = 'Comment', fg = colors.comment, gui = 'italic', cterm = 'italic' }, -- any comment
  { hg = 'Constant', fg = colors.Constant }, --any constant
  { hg = 'String', fg = colors.string }, --a string constant: "this is a string"
  { hg = 'Character', fg = colors.variable }, --a character constant: 'c', '\n' 
  --{ hg = 'Number', fg = colors.orange }, --a number constant: 234, 0xff
 -- { hg = 'Boolean', fg = colors.blue }, --a boolean constant: TRUE, false
  --{ hg = 'Float', fg = colors.orange }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.fg}, --any variable name
  { hg = 'Function', fg = colors.func}, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.keyword}, --any statement
 -- { hg = 'Conditional', fg = colors.purple }, --if, then, else, endif, switch, etc.
 -- { hg = 'Repeat', fg = colors.purple }, --for, do, while, etc.
 -- { hg = 'Label', fg = colors.purple }, --case, default, etc.
 --{ hg = 'Operator', fg = colors.blue}, --sizeof", "+", "*", etc.
 -- { hg = 'Keyword', fg = colors.purple }, --any other keyword
 -- { hg = 'Exception', fg = colors.purple }, --try, catch, throw
  { hg = 'PreProc', fg = colors.keyword}, --generic Preprocessor
 -- { hg = 'Include', fg = colors.purple}, --preprocessor #include
 -- { hg = 'Define', fg = colors.purple }, --preprocessor #define
 -- { hg = 'Macro', fg = colors.purple }, --same as Define
 -- { hg = 'PreCondit', fg = colors.yellow }, --preprocessor #if, #else, #endif, etc.
  { hg = 'Type', fg = colors.variable}, --int, long, char, etc.
--  { hg = 'StorageClass', fg = colors.purple }, --static, register, volatile, etc.
-- { hg = 'Structure', fg = colors.yellow }, --struct, union, enum, etc.
--  { hg = 'Typedef', fg = colors.yellow }, --A typedef
  { hg = 'Special', fg = colors.bright_blue}, --any special symbol
--  { hg = 'SpecialChar', fg = colors.orange }, --special character in a constant
--  { hg = 'Tag' }, --you can use CTRL-] on this
--  { hg = 'Delimiter'}, --character that needs attention
--  { hg = 'SpecialComment', fg = colors.base00 }, --special things inside a comment
  { hg = 'Debug' }, --debugging statements
  { hg = 'Underlined', gui = 'underline', cterm = 'underline' }, --text that stands out, HTML links
  { hg = 'Ignore' }, --left blank, hidden
  { hg = 'Error', fg = colors.red }, --any erroneous construct
  { hg = 'Todo', fg = colors.magneta }, --anything that needs extra attention; mostly the keywords TODO FIXME and XXX
  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn', bg = colors.bg_visual }, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal', fg=colors.fg_gutter }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor', bg = colors.bg }, --the character under the cursor
  { hg = 'CursorIM', link='Cursor' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine', link="Cursor" }, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory', fg = colors.blue }, --directory names (and other special names in listings)
  { hg = 'DiffAdd', bg = colors.diff_add, fg = colors.diff_add_fg }, --diff mode: Added line
  { hg = 'DiffChange', fg = colors.diff_change_fg ,bg=colors.diff_change, gui = 'underline', cterm = 'underline' }, --diff mode: Changed line

  { hg = 'DiffDelete', bg = colors.diff_delete, fg = colors.diff_delete_fg }, --diff mode: Deleted line
  { hg = 'DiffText',fg = colors.fg_gutter }, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg', fg = colors.error }, --error messages on the command line
  { hg = 'VertSplit', fg = colors.bg_visual, bg=colors.bg }, --the column separating vertically split windows
  { hg = 'Folded', fg = colors.fg, bg=colors.bg_visual_selection }, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn', fg=colors.fg_gutter }, --column where signs are displayed
  { hg = 'IncSearch', fg = colors.none, bg=colors.bg_search}, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr', fg=colors.comment, }, --Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  { hg = 'CursorLineNr', fg=colors.cursor_line_nr }, --Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  { hg = 'MatchParen', fg = colors.fg, bg=colors.match_paren_bg,gui = 'underline', cterm = 'underline' }, --The character under the cursor or just before it, if it is a paired bracket, and its match.
  { hg = 'ModeMsg', fg=colors.fg }, --'showmode' message (e.g., "-- INSERT --")
  { hg = 'MoreMsg',fg=colors.bg_visual }, --more-prompt
  { hg = 'NonText' }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
  { hg = 'Normal', fg =colors.fg,bg = colors.bg}, --normal text
  { hg = 'Pmenu', fg = colors.fg, bg = colors.pmenu_bg }, --Popup menu: normal item.
  { hg = 'PmenuSel', fg = colors.pmenu_bg, bg = colors.bright_blue}, --Popup menu: selected item.
  { hg = 'PmenuSbar', bg = colors.pmenu_bg }, --Popup menu: scrollbar.
  { hg = 'PmenuThumb', bg = colors.pmenu_sbar }, --Popup menu: Thumb of the scrollbar.
  { hg = 'Question', fg = colors.blue }, --hit-enter prompt and yes/no questions
  { hg = 'QuickFixLine',bg = colors.blue }, --Current quickfix item in the quickfix window.
  { hg = 'Search', fg = colors.none, bg = colors.bg_search }, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey', fg = colors.fg_gutter }, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad', fg = colors.error, gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap', fg = colors.warning }, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal', fg = colors.info }, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.hint }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg = colors.bg, bg = colors.blue }, --status line of current window
  { hg = 'StatusLineNC', fg = colors.fg, bg=colors.bg }, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
 -- { hg = 'StatusLineTerm', fg = colors.base03, bg = colors.base2 }, --status line of current :terminal window
 -- { hg = 'StatusLineTermNC', fg = colors.base01 }, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.fg, bg=colors.bg }, --tab pages line, not active tab page label
  { hg = 'TabLineFill', bg=colors.bg2 }, --tab pages line, where there are no labels
  { hg = 'TabLineSel', fg = colors.PmenuSel }, --tab pages line, active tab page label
  --{ hg = 'Terminal', fg = colors.base3, bg = colors.base3 }, --terminal window (see terminal-size-color)
  { hg = 'Title', fg = colors.variable }, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual', bg = colors.bg_visual_selection }, --Visual mode selection
  { hg = 'VisualNOS', bg = colors.bg_visual_selection }, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg', fg = colors.warning }, --warning messages
  { hg = 'WildMenu',bg = colors.bg_visual }, --current match in 'wildmenu' completion

  -- Diagnostics
  { hg = 'DiagnosticError', fg = colors.error },
  { hg = 'DiagnosticWarn', fg = colors.warning },
  { hg = 'DiagnosticInfo', fg = colors.info },
  { hg = 'DiagnosticHint', fg = colors.hint },
  { hg = 'DiagnosticUnderlineError', fg = colors.error, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineWarn', fg = colors.warning, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineInfo', fg = colors.info, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineHint', fg = colors.hint, gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
  { hg = 'LspReferenceWrite', fg = colors.LspReferenceText, gui='underline' },
  { hg = 'LspReferenceText', fg = colors.LspReferenceText, gui='underline' },
  { hg = 'LspReferenceRead', fg = colors.LspReferenceRead, gui='underline' },
  { hg = 'LspSignatureActiveParameter', fg=colors.LspSignatureActiveParameter, gui='bold' },

  -- ... an exception for my favorite plugin
  { hg = 'GitSignsAdd', fg = colors.git_add },
  { hg = 'GitSignsChange', fg = colors.git_change },
  { hg = 'GitSignsDelete', fg = colors.git_delete },
  { hg = 'GitSignsCurrentLineBlame', fg = colors.comment },

	 -- diff
  { hg =  "diffAdded" ,link = 'DiffAdd' },
  { hg =  "diffChanged",  link = 'DiffChange' },
  { hg =  "diffRemoved", link = 'DiffDelete' },
  { hg =  "diffOldFile" , fg = colors.yellow },
  { hg =  "diffNewFile" , fg = colors.orange },
  { hg =  "diffFile" ,fg = colors.blue },
  { hg = "diffLine" ,fg = colors.fg_gutter },
  { hg =  "diffIndexLine" ,fg = colors.magenta },

	-- Neogit
	{ hg =  "NeogitBranch " , fg = colors.keyword},
  { hg =  "NeogitRemote" , fg = colors.keyword},
  { hg =  "NeogitHunkHeader " , fg = colors.fg, bg=colors.bg_highlight},
  { hg =  "NeogitHunkHeaderHighlight" , fg = colors.blue, bg=colors.bg_highlight},
  { hg =  "NeogitDiffContextHighlight" , fg = colors.fg, bg=colors.bg}, 
  { hg =  "NeogitDiffAddHighlight" , fg = colors.diff_add}, 
  { hg =  "NeogitDiffDeleteHighlight" , fg = colors.diff_delete}, 

  -- LspTrouble
  { hg = 'LspTroubleText', fg = colors.fg },
  { hg = 'LspTroubleCount', fg = colors.magenta, bg=colors.fg_gutter },
  { hg = 'LspTroubleNormal', fg = colors.bright_yellow, bg=colors.bg_sidebar }, 
	
  -- These groups are for the neovim tree-sitter highlights.
  --{ hg =  "TSAnnotation " , fg = colors.red},
  --{ hg =  "TSAttribute" , fg = colors.purple},
  --{ hg =  "TSBoolean " , fg = colors.orange},
  --{ hg =  "TSCharacter" , fg = colors.green},
  --{ hg =  "TSComment" , fg = colors.green}, 
  --{ hg =  "SConditional" , fg = colors.green}, 
  { hg =  "TSNote" , fg = colors.bg, bg=colors.info}, 
  { hg =  "TSWarning" , fg = colors.bg, bg=colors.warning}, 
  { hg =  "TSDanger" , fg = colors.bg, bg=colors.error}, 
  { hg =  "TSConstant " , fg = colors.constant}, 
  { hg =  "commentTSConstant" , fg = colors.keyword},
  { hg =  "TSConstBuiltin" , fg = colors.variable}, 
  { hg =  "TSConstMacro" , fg = colors.variable},
  { hg =  "TSConstructor" , fg = colors.fg},
  --{ hg =  "TSError" , fg = colors.green},
  --{ hg =  "TSException" , fg = colors.cyan},
  { hg =  "TSField" , fg = colors.fg},
  --{ hg =  "TSFloat " , fg = colors.blue},
  --{ hg =  "TSFunction" , fg = colors.green}, 
  --{ hg =  "TSFuncBuiltin" , fg = colors.variable}, 
  --{ hg =  "TSFuncMacro" , fg = colors.magneta}, 
  { hg =  "TSInclude " , fg = colors.keyword}, 
  { hg =  "TSKeyword" , fg = colors.keyword},
  { hg =  "TSKeywordFunction" , fg = colors.keyword},
  --{ hg =  "TSKeywordOperator" , fg = colors.magneta},
  --{ hg =  "TSKeywordReturn" , fg = colors.magneta},
  { hg =  "TSLabel" , fg = colors.blue},
 -- { hg =  "TSMethod" , fg = colors.magneta},
  { hg =  "TSNamespace" , fg = colors.fg},
 -- { hg =  "TSNone" , fg = colors.green},  
 -- { hg =  "TSNumber" , fg = colors.purple},
  { hg =  "TSOperator" , fg = colors.keyword},
  { hg =  "TSParameter" , fg = colors.variable}, 
  --{ hg =  "TSParameterReference" , fg = colors.base00},
  --{ hg =  "TSPreProc" , fg = colors.base00},
   { hg =  "TSProperty" , fg = colors.fg},
  --{ hg =  "TSString" , fg = colors.cyan},
  { hg =  "TSStringRegex" , fg = colors.variable},
  { hg =  "TSStringEscape" , fg = colors.red},
  --{ hg =  "TSStringSpecial" , fg = blue},
  --{ hg =  "TSRepeat" , fg = colors},
  --{ hg =  "TSStorageClass" , fg = colors},
  { hg =  "TSType " , fg = colors.variable, gui="bold"},
  { hg =  "TSTypeBuiltin " , fg = colors.constant},
  --{ hg =  "TSTypeDefinition" , fg = colors},
  --{ hg =  "TSTypeQualifier" , fg = colors.cyan}, 
  { hg =  "TSVariable" , fg = colors.variable},
  { hg =  "TSVariableBuiltin", fg = colors.constant},
  { hg =  'TSTag', fg = colors.constant},
  { hg =  'TSTagAttribute', fg = colors.constant},
  { hg =  'TSPunctDelimiter', fg = colors.fg},
  --{ hg =  'TSPunctSpecial', fg = colors.cyan},
  { hg =  'TSTagDelimite', fg = colors.green},
  { hg =  'TSPunctBracket', fg = colors.fg},
  --{ hg =  'TSText', fg = colors.base00},
  { hg =  'TSTextReference ', fg = colors.red},

  -- Telescope
  { hg = "TelescopePromptBorder", fg = colors.border }, 
  { hg = "TelescopePromptPrefix", fg = colors.fg }, 
  { hg = "TelescopeMatching" , fg = colors.variable}, 
  { hg = "TelescopeMultiSelection" , fg = colors.PmenuSel }, 
  { hg = "TelescopeSelection" , fg = colors.PmenuSel},
  { hg = "TelescopeSelectionCaret" , fg = colors.PmenuSel }, 

  -- typescript
	{ hg = "typescriptTSType" , fg = colors.variable }, 
  { hg = "typescriptTSConstructor" , fg = colors.fg}, 
  { hg = "typescriptTSTypeBuiltin" , fg = colors.constant}, 

	-- javascript
  { hg = "javascriptTSType", fg = colors.variable },
  { hg = "javascriptTSParameter", fg = colors.param },
  { hg = "javascriptTSVariable", fg = colors.variable },
  { hg = "javascriptTSPunctDelimiter", fg = colors.fg },
  { hg = "javascriptTSStringRegex", fg = colors.string },
  { hg = "javascriptTSConstructor", fg = colors.variable},
  { hg = "javascriptTSProperty",fg = colors.func },
  { hg = "regexTSStringEscape", fg = colors.keyword },

  -- html
--	{ hg = 'htmlTSConstant', fg = colors.constant}, 
--	{ hg = 'htmlTag', fg = colors.fg}, 
--	{ hg = 'htmlEndTag', fg = colors.fg}, 
--	{ hg = 'htmlTagName', fg = colors.constant}, 
--	{ hg = 'htmlArg', fg = colors.constant},

	-- CSS
  { hg = "cssTSProperty", fg = colors.func},
  { hg = "cssTSType", fg = colors.tag },

  --IndentBlankline
	{ hg = "IndentBlanklineChar" , fg = colors.bright_white}, 

	--ts_rainbow
	 { hg = 'rainbowcol1', fg = colors.orange, bg = colors.none }, 
--	 { hg = 'rainbowcol2', fg = colors.bright_green, bg = colors.none }, 
--	 { hg = 'rainbowcol3', fg = colors.yellow , bg = colors.none }, 
--	 { hg = 'rainbowcol4', fg = colors.blue, bg = colors.none }, 
--	 { hg = 'rainbowcol5', fg = colors.magenta, bg = colors.none }, 
--	 { hg = 'rainbowcol6', fg = colors.cyan, bg = colors.none }, 
--	 { hg = 'rainbowcol7', fg = colors.white, bg = colors.none },
}


M.colorscheme = function()
  local highlight_cmds = {}
  for idx = 1, #highlights do
    local highlight = highlights[idx]
    highlight_cmds[idx] = string.format(
      'highlight %s guifg=%s guibg=%s gui=%s guisp=%s',
      highlight.hg,
      highlight.fg or 'NONE',
      highlight.bg or 'NONE',
      highlight.gui or 'NONE',
      highlight.guisp or 'NONE'
    )
  end
  vim.cmd(table.concat(highlight_cmds, '\n'))
end
return M
