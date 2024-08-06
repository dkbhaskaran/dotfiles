-- Core options

-- global statusline
-- 0: The status line is never shown.
-- 1: The status line is shown only if there are at least two windows open.
-- 2: The status line is always shown (unless Vim is in "very magic" mode, such as when using /).
-- 3: Similar to 2, the status line is always shown, but the cursor line and column numbers are not displayed.
vim.opt.laststatus = 2

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- TODO
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- option to customize the characters used for filling various parts of the
-- interface, such as the status line, vertical and horizontal splits, and more.
-- example set fillchars+=vert:\|
-- Common keys
--  eol: Character(s) used to fill the end-of-line area (e.g., when wrapping lines).
--  fold: Character(s) used to fill the space below a closed fold.
--  vert: Character(s) used to fill the space between vertical splits.
--  msgsep: Character(s) used to separate messages in the command-line area.
--  diff: Character(s) used to indicate differences in diff mode.
--  statusline: Character(s) used to fill the status line.
--  eob: End of buffer
vim.opt.fillchars = { eob = ' ' }

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Configure how new splits should be opened
vim.opt.splitbelow = true
vim.opt.splitright = true

-- is an option that controls whether Vim should use true colors
-- (24-bit or "true color" RGB values) in the terminal.
vim.opt.termguicolors = true

-- This option is useful when defining mappings that consist of multiple key presses.
-- If Vim detects that the key sequence matches a mapped command, it waits for the
-- specified time to see if more keys will be pressed to complete the sequence.
vim.opt.timeoutlen = 400

-- Save undo history
vim.opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- The signcolumn is a vertical column displayed alongside the line numbers on
-- the left side of the window.
vim.opt.signcolumn = 'auto' -- sets vim.opt.signcolumn to auto

-- Enforcing the default. Create a backup file.
vim.opt.backup = true
local backup_dir = vim.fn.stdpath 'config' .. 'backup'
if vim.fn.isdirectory(backup_dir) == 0 then
  -- create the directory
  vim.fn.mkdir(backup_dir, 'p')
end
vim.opt.backupdir = backup_dir

-- shows matches for ({[
vim.opt.showmatch = true

-- colorcolumn width
vim.opt.colorcolumn = '85'

-- set numbers
vim.opt.number = true

-- add debug package
vim.api.nvim_command 'packadd termdebug'
vim.api.nvim_set_var('termdebug_wide', 1)

-- Enhanced CPP highlight options
vim.g.cpp_class_scope_highlight = 1
vim.g.cpp_member_variable_highlight = 1
vim.g.cpp_member_highlight = 1
vim.g.cpp_class_decl_highlight = 1
vim.g.cpp_attributes_highlight = 1

-- Python highlighting options
vim.g.python_highlight_class_vars = 1
vim.g.python_highlight_func_calls = 1
vim.g.python_highlight_string_formatting = 1
vim.g.python_highlight_string_format = 1
vim.g.python_highlight_exceptions = 1

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
-- vim: ts=2 sts=2 sw=2 et
