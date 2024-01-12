-- Create a script that can load a .debug.env file from the project root
-- and use it to load in envs into the debug session.
--
-- Create a function/config/command/something that can accept
-- go build flags when starting the go debugger. This would help
-- a lot when debugging integration tests as they are usually behind
-- a build flag.
return {
  'mfussenegger/nvim-dap',
  dependencies  = {
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go'
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local dapgo = require('dap-go')
    dapgo.setup()

    require('dapui').setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
    vim.keymap.set('n', '<leader>td', dapgo.debug_test, {})
  end,
}
