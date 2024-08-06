-- Called from toplevel init

require 'core.options'
require 'core.mappings'

local autocmd = vim.api.nvim_create_autocmd
autocmd('VimResized', {
  pattern = '*',
  command = 'tabdo wincmd =',
})
