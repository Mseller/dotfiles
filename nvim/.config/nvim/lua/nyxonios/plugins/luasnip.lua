return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    vim.keymap.set('i', '<c-u>', require 'luasnip.extras.select_choice')
    require('luasnip.loaders.from_lua').lazy_load { paths = { vim.fn.stdpath 'config' .. '/lua/nyxonios/luasnippets' } }
  end,
}
