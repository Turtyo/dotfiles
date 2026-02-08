require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<Leader>cu", require('crates').upgrade_all_crates, { desc = "Update all crates"})

local tls = require("telescope.builtin")
map('n', '<leader>ff', tls.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', tls.live_grep, { desc = 'Telescope live grep' })

local nt = require("nvim-tree.api").tree
map('n', '<leader>tt', nt.toggle)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map('n', '<Leader>nb', ':bnext<cr>', { desc = "Go to next buffer"})
map('n', '<Leader>pb', ':bprevious<cr>', { desc = "Go to previous buffer"})
map('n', '<Leader>db', ':bdelete<cr>', { desc = "Close current buffer"})

map('n', '<Leader>rn',
function()
    -- when rename opens the prompt, this autocommand will trigger
    -- it will "press" CTRL-F to enter the command-line window `:h cmdwin`
    -- in this window I can use normal mode keybindings
    local cmdId
    cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
        callback = function()
          local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
          vim.api.nvim_feedkeys(key, "c", false)
          vim.api.nvim_feedkeys("0", "n", false)
          -- autocmd was triggered and so we can remove the ID and return true to delete the autocmd
          cmdId = nil
          return true
        end,
      })
    vim.lsp.buf.rename()
    -- if LPS couldn't trigger rename on the symbol, clear the autocmd
    vim.defer_fn(function()
        -- the cmdId is not nil only if the LSP failed to rename
        if cmdId then
          vim.api.nvim_del_autocmd(cmdId)
        end
      end, 500)
  end
, { desc = "Rename symbol in current file"})
