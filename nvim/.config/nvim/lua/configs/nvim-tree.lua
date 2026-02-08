local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<leader>tu', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '<leader>tf', api.tree.open, opts('Open / Focus'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', '<leader>cd', api.tree.change_root_to_node, opts('Change directory'))
  vim.keymap.set('n', '<leader>cn', api.fs.create, opts('Create new file / directory'))
  vim.keymap.set('n', '<leader>rn', api.fs.rename, opts('Rename file'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
