return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      }
    }
  },

  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },

  --{
  --  "hrsh7th/nvim-cmp",
  --  opts = function()
  --    local M = require("nvchad.configs.cmp")
  --    table.insert(M.sources, { name = 'crates'})
  --    return M
  --  end,
  --  enabled = function()
  --    print("hello")
  --    local disabled = false
  --    disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
  --    disabled = disabled or (vim.fn.reg_recording() ~= '')
  --    disabled = disabled or (vim.fn.reg_executing() ~= '')
  --    disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
  --    print(not disabled)
  --    return not disabled
  --  end,
  --},

  {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local tls = require("telescope")
      tls.setup({
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
          },
        },
      })

      tls.load_extension("fzf")
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function ()
      require("configs.nvim-tree")
    end

  }


  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
