-- Called from toplevel init

require 'core.options'
require 'core.mappings'

local autocmd = vim.api.nvim_create_autocmd
autocmd('VimResized', {
  pattern = '*',
  command = 'tabdo wincmd =',
})

-- Create an autocommand group to manage the autocommand
vim.api.nvim_create_augroup('DisableMiniStatusLine', { clear = true })

autocmd('FileType', {
  pattern = 'log',
  callback = function()
    vim.opt.laststatus = 0
  end,
  group = 'DisableMiniStatusLine', -- Specify the group
})
