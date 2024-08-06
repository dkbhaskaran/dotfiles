-- For Arista vim configurations

vim.g.python_recommended_style = 0
vim.g.alternateExtensions_tac = 'tin,itin'
vim.g.alternateExtensions_tin = 'tac'
vim.g.alternateExtensions_itin = 'tac'

vim.cmd 'source /usr/share/vim/vimfiles/arista.vim'

-- Setup LSP servers for tac, tin, python
local lsp_servers = {
  {
    name = 'artaclsp',
    cmd = { '/usr/bin/artaclsp', '-I', '/bld/' },
    filetypes = { 'tac' },
    root_dir = function()
      return '/src/'
    end,
  },
  {
    name = 'ar-pylint-ls',
    cmd = { 'ar-pylint-ls' },
    filetypes = { 'python' },
    root_dir = function()
      return '/src/'
    end,
  },
  {
    name = 'ar-formatdiff-ls',
    cmd = { 'ar-formatdiff-ls' },
    filetypes = { 'cpp', 'python' },
    root_dir = function()
      return '/src/'
    end,
  },
}

vim.keymap.set('n', '<leader>lf', function()
  vim.lsp.buf.format { timeout_ms = 5000 }
end)

for _, server in ipairs(lsp_servers) do
  require('lspconfig.configs')[server.name] = { default_config = server }
  require('lspconfig')[server.name].setup {}
end

vim.keymap.set('n', '<leader>lf', function()
  vim.lsp.buf.format { timeout_ms = 5000 }
end)
