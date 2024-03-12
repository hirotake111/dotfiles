local option = { noremap = true }
local telescope = require('telescope.builtin')

-- search and open a file
vim.keymap.set('n', '<leader>ff', telescope.find_files, option)
vim.keymap.set('n', '<leader>o', telescope.find_files, option)
vim.keymap.set('n', '<C-p>', telescope.git_files, option)

-- list all errors in the current file
vim.keymap.set('n', 'dl', telescope.diagnostics, option)

-- fuzzy finder
vim.keymap.set('n', '<leader>ps', function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end)
