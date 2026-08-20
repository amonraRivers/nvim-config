-- erosion-light
-- Neovim colorscheme matching the erosion-light kitty theme.
--
-- The 16 ANSI values are taken verbatim from erosion-light.conf so the editor
-- and the shell around it agree exactly. Everything else is derived in OKLCH
-- from the same anchors: surfaces hold the background's hue (68) and chroma
-- (0.012) and vary only in lightness, floats sitting ABOVE the background and
-- cursorline below it.
--
-- Note on the neutrals: this theme's color7/color8/color15 are deliberately
-- tinted (warm gold, rosy, blue-grey) rather than forming a grey ramp, so they
-- are NOT reused for comments and line numbers. Those get their own derivation
-- on the background hue, tuned to the same contrast ratios as erosion-dark
-- (comments 4.5:1, line numbers 3.5:1).
--
-- Install: ~/.config/nvim/colors/erosion-light.lua
-- Use:     vim.cmd.colorscheme("erosion-light")

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "erosion-light"
vim.o.termguicolors = true

local c = {
  -- ANSI 0-15, identical to the kitty theme
  bg         = "#EDE6DF",
  fg         = "#383B43",
  black      = "#383B43",
  br_black   = "#8D716E",
  red        = "#A52A26",
  br_red     = "#81010A",
  green      = "#05791F",
  br_green   = "#01470E",
  yellow     = "#705301",
  br_yellow  = "#4F3900",
  blue       = "#0157AB",
  br_blue    = "#003C7B",
  magenta    = "#8C3287",
  br_magenta = "#6D0E69",
  cyan       = "#016165",
  br_cyan    = "#024346",
  white      = "#775F4A",
  br_white   = "#465171",

  -- derived surfaces (background hue; floats rise, cursorline sinks)
  bg_dark    = "#E2DBD4",  -- sunken: tablines, tree panes
  bg_alt     = "#E2DBD4",  -- cursorline
  bg_float   = "#F2EBE4",  -- raised: popups, floats
  bg_sel     = "#D2CBC4",  -- visual
  bg_border  = "#BDB6AF",

  -- derived muted text (own ramp, not the tinted ANSI slots)
  fg_comment = "#6E6760",  -- 4.5:1
  fg_dim     = "#807871",  -- 3.5:1
  fg_alt     = "#605A53",  -- 5.5:1

  -- derived diff grounds (pale tints)
  diff_add   = "#CCDDCC",
  diff_del   = "#EBD1CD",
  diff_chg   = "#CBD9EC",
  diff_txt   = "#C2E2C2",
}

-- expose the palette to :terminal buffers so they match too
local ansi = {
  c.black, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.white,
  c.br_black, c.br_red, c.br_green, c.br_yellow, c.br_blue, c.br_magenta,
  c.br_cyan, c.br_white,
}
for i, hex in ipairs(ansi) do
  vim.g["terminal_color_" .. (i - 1)] = hex
end

local hl = function(group, spec) vim.api.nvim_set_hl(0, group, spec) end

local groups = {
  ---------------------------------------------------------------- editor UI
  Normal            = { fg = c.fg, bg = c.bg },
  NormalNC          = { fg = c.fg, bg = c.bg },
  NormalFloat       = { fg = c.fg, bg = c.bg_float },
  FloatBorder       = { fg = c.bg_border, bg = c.bg_float },
  FloatTitle        = { fg = c.cyan, bg = c.bg_float, bold = true },
  Cursor            = { fg = c.bg, bg = c.cyan },
  lCursor           = { fg = c.bg, bg = c.cyan },
  CursorIM          = { fg = c.bg, bg = c.cyan },
  TermCursor        = { fg = c.bg, bg = c.cyan },
  CursorLine        = { bg = c.bg_alt },
  CursorColumn      = { bg = c.bg_alt },
  ColorColumn       = { bg = c.bg_alt },
  CursorLineNr      = { fg = c.yellow, bold = true },
  LineNr            = { fg = c.fg_dim },
  LineNrAbove       = { fg = c.fg_dim },
  LineNrBelow       = { fg = c.fg_dim },
  SignColumn        = { bg = c.bg },
  FoldColumn        = { fg = c.fg_dim, bg = c.bg },
  Folded            = { fg = c.fg_alt, bg = c.bg_alt },
  VertSplit         = { fg = c.bg_border },
  WinSeparator      = { fg = c.bg_border },
  Visual            = { bg = c.bg_sel },
  VisualNOS         = { bg = c.bg_sel },
  Search            = { fg = c.bg, bg = c.fg_alt },
  IncSearch         = { fg = c.bg, bg = c.yellow, bold = true },
  CurSearch         = { fg = c.bg, bg = c.yellow, bold = true },
  Substitute        = { fg = c.bg, bg = c.red },
  MatchParen        = { fg = c.br_cyan, bold = true, underline = true },
  NonText           = { fg = c.bg_border },
  Whitespace        = { fg = c.bg_border },
  SpecialKey        = { fg = c.bg_border },
  EndOfBuffer       = { fg = c.bg },
  Conceal           = { fg = c.fg_dim },
  Directory         = { fg = c.cyan },
  Title             = { fg = c.cyan, bold = true },
  ErrorMsg          = { fg = c.br_red },
  WarningMsg        = { fg = c.br_yellow },
  MoreMsg           = { fg = c.green },
  ModeMsg           = { fg = c.fg, bold = true },
  Question          = { fg = c.cyan },
  QuickFixLine      = { bg = c.bg_sel },
  WildMenu          = { fg = c.bg, bg = c.cyan },
  StatusLine        = { fg = c.fg, bg = c.bg_float },
  StatusLineNC      = { fg = c.fg_dim, bg = c.bg_alt },
  TabLine           = { fg = c.fg_dim, bg = c.bg_alt },
  TabLineFill       = { bg = c.bg_sel },
  TabLineSel        = { fg = c.bg, bg = c.cyan, bold = true },
  WinBar            = { fg = c.fg_alt, bg = c.bg },
  WinBarNC          = { fg = c.fg_dim, bg = c.bg },
  Pmenu             = { fg = c.fg, bg = c.bg_float },
  PmenuSel          = { fg = c.bg, bg = c.cyan },
  PmenuSbar         = { bg = c.bg_sel },
  PmenuThumb        = { bg = c.bg_border },
  PmenuKind         = { fg = c.magenta, bg = c.bg_float },
  PmenuExtra        = { fg = c.fg_dim, bg = c.bg_float },
  MsgArea           = { fg = c.fg },
  MsgSeparator      = { fg = c.bg_border },
  SpellBad          = { sp = c.red, undercurl = true },
  SpellCap          = { sp = c.yellow, undercurl = true },
  SpellLocal        = { sp = c.cyan, undercurl = true },
  SpellRare         = { sp = c.magenta, undercurl = true },

  ------------------------------------------------------------------- syntax
  Comment           = { fg = c.fg_comment, italic = true },
  Constant          = { fg = c.magenta },
  String            = { fg = c.green },
  Character         = { fg = c.green },
  Number            = { fg = c.magenta },
  Boolean           = { fg = c.magenta },
  Float             = { fg = c.magenta },
  Identifier        = { fg = c.fg },
  Function          = { fg = c.cyan },
  Statement         = { fg = c.red },
  Conditional       = { fg = c.red },
  Repeat            = { fg = c.red },
  Label             = { fg = c.red },
  Operator          = { fg = c.br_cyan },
  Keyword           = { fg = c.red },
  Exception         = { fg = c.red },
  PreProc           = { fg = c.yellow },
  Include           = { fg = c.yellow },
  Define            = { fg = c.yellow },
  Macro             = { fg = c.yellow },
  PreCondit         = { fg = c.yellow },
  Type              = { fg = c.blue },
  StorageClass      = { fg = c.blue },
  Structure         = { fg = c.blue },
  Typedef           = { fg = c.blue },
  Special           = { fg = c.br_yellow },
  SpecialChar       = { fg = c.br_yellow },
  Tag               = { fg = c.cyan },
  Delimiter         = { fg = c.fg_alt },
  SpecialComment    = { fg = c.fg_alt, italic = true },
  Debug             = { fg = c.red },
  Underlined        = { underline = true },
  Bold              = { bold = true },
  Italic            = { italic = true },
  Ignore            = { fg = c.fg_dim },
  Error             = { fg = c.br_red },
  Todo              = { fg = c.bg, bg = c.yellow, bold = true },

  --------------------------------------------------------------- diagnostics
  DiagnosticError            = { fg = c.red },
  DiagnosticWarn             = { fg = c.yellow },
  DiagnosticInfo             = { fg = c.blue },
  DiagnosticHint             = { fg = c.cyan },
  DiagnosticOk               = { fg = c.green },
  DiagnosticUnderlineError   = { sp = c.red, undercurl = true },
  DiagnosticUnderlineWarn    = { sp = c.yellow, undercurl = true },
  DiagnosticUnderlineInfo    = { sp = c.blue, undercurl = true },
  DiagnosticUnderlineHint    = { sp = c.cyan, undercurl = true },
  DiagnosticUnderlineOk      = { sp = c.green, undercurl = true },
  DiagnosticVirtualTextError = { fg = c.red, bg = c.diff_del },
  DiagnosticVirtualTextWarn  = { fg = c.yellow, bg = c.bg_alt },
  DiagnosticVirtualTextInfo  = { fg = c.blue, bg = c.diff_chg },
  DiagnosticVirtualTextHint  = { fg = c.cyan, bg = c.bg_alt },
  DiagnosticVirtualTextOk    = { fg = c.green, bg = c.diff_add },
  DiagnosticDeprecated       = { fg = c.fg_dim, strikethrough = true },
  DiagnosticUnnecessary      = { fg = c.fg_dim },

  ---------------------------------------------------------------------- diff
  DiffAdd           = { bg = c.diff_add },
  DiffChange        = { bg = c.diff_chg },
  DiffDelete        = { bg = c.diff_del },
  DiffText          = { bg = c.diff_txt },
  Added             = { fg = c.green },
  Changed           = { fg = c.blue },
  Removed           = { fg = c.red },

  ----------------------------------------------------------------- treesitter
  ["@variable"]              = { fg = c.fg },
  ["@variable.builtin"]      = { fg = c.red, italic = true },
  ["@variable.parameter"]    = { fg = c.fg_alt },
  ["@variable.member"]       = { fg = c.blue },
  ["@constant"]              = { fg = c.magenta },
  ["@constant.builtin"]      = { fg = c.magenta, italic = true },
  ["@constant.macro"]        = { fg = c.yellow },
  ["@module"]                = { fg = c.blue },
  ["@label"]                 = { fg = c.red },
  ["@string"]                = { fg = c.green },
  ["@string.escape"]         = { fg = c.br_yellow },
  ["@string.special"]        = { fg = c.br_yellow },
  ["@string.regexp"]         = { fg = c.br_green },
  ["@character"]             = { fg = c.green },
  ["@number"]                = { fg = c.magenta },
  ["@boolean"]               = { fg = c.magenta },
  ["@type"]                  = { fg = c.blue },
  ["@type.builtin"]          = { fg = c.blue, italic = true },
  ["@attribute"]             = { fg = c.yellow },
  ["@property"]              = { fg = c.blue },
  ["@function"]              = { fg = c.cyan },
  ["@function.builtin"]      = { fg = c.cyan, italic = true },
  ["@function.macro"]        = { fg = c.yellow },
  ["@constructor"]           = { fg = c.br_cyan },
  ["@operator"]              = { fg = c.br_cyan },
  ["@keyword"]               = { fg = c.red },
  ["@keyword.function"]      = { fg = c.red },
  ["@keyword.return"]        = { fg = c.br_red },
  ["@keyword.import"]        = { fg = c.yellow },
  ["@keyword.exception"]     = { fg = c.br_red },
  ["@punctuation.delimiter"] = { fg = c.fg_alt },
  ["@punctuation.bracket"]   = { fg = c.fg_alt },
  ["@punctuation.special"]   = { fg = c.br_cyan },
  ["@comment"]               = { fg = c.fg_comment, italic = true },
  ["@comment.error"]         = { fg = c.bg, bg = c.red, bold = true },
  ["@comment.warning"]       = { fg = c.bg, bg = c.yellow, bold = true },
  ["@comment.todo"]          = { fg = c.bg, bg = c.cyan, bold = true },
  ["@comment.note"]          = { fg = c.bg, bg = c.blue, bold = true },
  ["@markup.heading"]        = { fg = c.cyan, bold = true },
  ["@markup.strong"]         = { bold = true },
  ["@markup.italic"]         = { italic = true },
  ["@markup.strikethrough"]  = { strikethrough = true },
  ["@markup.underline"]      = { underline = true },
  ["@markup.link"]           = { fg = c.blue, underline = true },
  ["@markup.link.label"]     = { fg = c.cyan },
  ["@markup.raw"]            = { fg = c.green },
  ["@markup.list"]           = { fg = c.br_cyan },
  ["@markup.quote"]          = { fg = c.fg_alt, italic = true },
  ["@tag"]                   = { fg = c.red },
  ["@tag.attribute"]         = { fg = c.yellow },
  ["@tag.delimiter"]         = { fg = c.fg_alt },
  ["@diff.plus"]             = { fg = c.green },
  ["@diff.minus"]            = { fg = c.red },
  ["@diff.delta"]            = { fg = c.blue },

  ------------------------------------------------------------ LSP / semantic
  ["@lsp.type.class"]         = { link = "@type" },
  ["@lsp.type.enum"]          = { link = "@type" },
  ["@lsp.type.interface"]     = { link = "@type" },
  ["@lsp.type.struct"]        = { link = "@type" },
  ["@lsp.type.parameter"]     = { link = "@variable.parameter" },
  ["@lsp.type.variable"]      = { link = "@variable" },
  ["@lsp.type.property"]      = { link = "@property" },
  ["@lsp.type.enumMember"]    = { link = "@constant" },
  ["@lsp.type.function"]      = { link = "@function" },
  ["@lsp.type.method"]        = { link = "@function" },
  ["@lsp.type.macro"]         = { link = "@function.macro" },
  ["@lsp.type.decorator"]     = { link = "@attribute" },
  ["@lsp.type.namespace"]     = { link = "@module" },
  ["@lsp.type.comment"]       = { link = "@comment" },
  ["@lsp.mod.deprecated"]     = { strikethrough = true },
  LspReferenceText            = { bg = c.bg_sel },
  LspReferenceRead            = { bg = c.bg_sel },
  LspReferenceWrite           = { bg = c.bg_sel, underline = true },
  LspSignatureActiveParameter = { fg = c.br_yellow, bold = true },
  LspInlayHint                = { fg = c.fg_comment, bg = c.bg_alt, italic = true },
  LspCodeLens                 = { fg = c.fg_dim, italic = true },
  LspInfoBorder               = { fg = c.bg_border, bg = c.bg_float },

  ---------------------------------------------------------- common plugins
  GitSignsAdd            = { fg = c.green },
  GitSignsChange         = { fg = c.blue },
  GitSignsDelete         = { fg = c.red },
  GitSignsAddInline      = { bg = c.diff_add },
  GitSignsChangeInline   = { bg = c.diff_chg },
  GitSignsDeleteInline   = { bg = c.diff_del },

  TelescopeNormal        = { fg = c.fg, bg = c.bg_float },
  TelescopeBorder        = { fg = c.bg_border, bg = c.bg_float },
  TelescopeTitle         = { fg = c.bg, bg = c.cyan, bold = true },
  TelescopeSelection     = { bg = c.bg_sel },
  TelescopeMatching      = { fg = c.br_yellow, bold = true },
  TelescopePromptPrefix  = { fg = c.cyan },

  BlinkCmpMenu           = { fg = c.fg, bg = c.bg_float },
  BlinkCmpMenuBorder     = { fg = c.bg_border, bg = c.bg_float },
  BlinkCmpMenuSelection  = { bg = c.bg_sel },
  BlinkCmpLabelMatch     = { fg = c.br_yellow, bold = true },
  BlinkCmpKind           = { fg = c.magenta },

  CmpItemAbbr            = { fg = c.fg },
  CmpItemAbbrMatch       = { fg = c.br_yellow, bold = true },
  CmpItemKind            = { fg = c.magenta },
  CmpItemMenu            = { fg = c.fg_dim },

  NeoTreeNormal          = { fg = c.fg, bg = c.bg_dark },
  NeoTreeNormalNC        = { fg = c.fg, bg = c.bg_dark },
  NeoTreeDirectoryName   = { fg = c.cyan },
  NeoTreeDirectoryIcon   = { fg = c.cyan },
  NeoTreeGitModified     = { fg = c.blue },
  NeoTreeGitAdded        = { fg = c.green },
  NeoTreeGitDeleted      = { fg = c.red },

  IndentBlanklineChar        = { fg = c.bg_border },
  IblIndent                  = { fg = c.bg_border },
  IblScope                   = { fg = c.fg_dim },

  WhichKeyFloat          = { bg = c.bg_float },
  WhichKeyBorder         = { fg = c.bg_border, bg = c.bg_float },

  NotifyERRORBorder      = { fg = c.red },
  NotifyWARNBorder       = { fg = c.yellow },
  NotifyINFOBorder       = { fg = c.blue },
  NotifyDEBUGBorder      = { fg = c.fg_dim },
  NotifyTRACEBorder      = { fg = c.magenta },
}

for group, spec in pairs(groups) do
  hl(group, spec)
end
