-- alias some long apis
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = true}
}

-- remap jk to Esc
vim.keybinds.gmap("i", "jk", "<Esc>", vim.keybinds.opts)

-- C-u and C-d scroll 10 lines instead of half page
vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)

-- adjust split size. Ctrl + Arrows
vim.keybinds.gmap("n", "<C-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)

-- toggle highlight search 
vim.keybinds.gmap("n", "<F3>", ":set hlsearch!<CR>", vim.keybinds.opts)

-- leader + cs to perform spell check
vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)