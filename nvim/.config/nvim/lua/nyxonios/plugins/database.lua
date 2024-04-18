return {
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  dependencies = {
    'hrsh7th/nvim-cmp',
    'nvim-lua/plenary.nvim',
  },
  -- YfheXWvkEkuq_H6Q
  -- postgresql://parnter_product_service:YfheXWvkEkuq_H6Q@127.0.0.1:6000/partner_product_service
  -- postgresql://filtering_service:dcwjEw5gYTBJoivw@localhost:6000/postgres
  config = function()
    require('vim-dadbod-ui').setup()
    require('vim-dadbod-completion').setup()

    vim.g.db_ui_use_nerd_fonts = 1
    local db_completion = function()
      require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
    end
    vim.g.db_ui_save_location = vim.fn.stdpath 'config' .. require('plenary.path').path.sep .. 'db_ui'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'sql',
      },
      command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'sql',
        'mysql',
        'plsql',
      },
      callback = function()
        vim.schedule(db_completion)
      end,
    })
  end,
}
