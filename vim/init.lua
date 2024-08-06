-- Dinesh's nvim configurations :)

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core of the settings
require 'core'

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  require('core.bootstrap').lazy(lazypath)
end
vim.opt.rtp:prepend(lazypath)

require 'plugins'

-- Arista vim plugins and settings. Must have LSP configured before Arista plugins are loaded.

-- vim.fn.stdpath is a function that provides standardized paths
-- to certain directories commonly used in Vim scripting and configuration.
-- Usage vim.fn.stdpath({name}). name can be
-- 	config :  Typically ~/.vim or ~/vimfiles or ~/.config/nvim
-- 	data   :  ~/.vim or ~/.local/nvim
-- 	cache  :  ~/.cache/nvim
-- 	runtime: The runtime directory
-- 	home   : user home directory
local arista_config_path = vim.fn.stdpath 'config' .. '/lua/arista'
if vim.loop.fs_stat(arista_config_path) then
  require 'arista'
end

-- vim: ts=2 sts=2 sw=2 et
