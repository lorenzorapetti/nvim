-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

Util = require 'util'

require 'options'
require 'ui2'
require 'keymaps'
require 'autocmds'
require 'plugins'
