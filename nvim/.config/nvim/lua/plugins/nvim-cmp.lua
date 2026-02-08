return {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require("nvchad.configs.cmp")
      table.insert(M.sources, {name = "crates"})
      M.enabled = function()
        local disabled = false
        disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
        disabled = disabled or (vim.fn.reg_recording() ~= '')
        disabled = disabled or (vim.fn.reg_executing() ~= '')
        disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
        return not disabled
      end
      return M
    end,
}

