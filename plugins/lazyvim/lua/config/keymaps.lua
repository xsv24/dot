-- LazyVim default keymaps
-- https://github.com/LazyVim/LazyVim/blob/63150fa4c5ec8a6f5c56e9035599a8c8e32dc8ed/lua/lazyvim/config/keymaps.lua#L5
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- fzf-lua bindings
-- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#commands
local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>p", fzf.files, { desc = "Files" })
vim.keymap.set("n", "<leader>/", fzf.live_grep_glob, { desc = "Quick search" })
vim.keymap.set("n", "<leader>fh", fzf.tags, { desc = "Find tags" })
vim.keymap.set({ "n", "x" }, "zs", fzf.spell_suggest, { desc = "Spelling suguestions" })

-- Git
vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gB", fzf.git_branches, { desc = "Git branches" })
vim.keymap.set({ "n", "x" }, "<leader>go", function()
  require("snacks").gitbrowse()
end, { desc = "Perm Link" })
vim.keymap.set({ "n", "x" }, "<leader>gl", function()
  require("snacks").gitbrowse({
    open = function(url)
      vim.fn.setreg("+", url)
    end,
  })
end, { desc = "Perm Link (copy)" })
vim.keymap.set("n", "<leader>gn", require("neogit").open, { desc = "Neogit" })

-- Navigate between panes with arrow keys
vim.keymap.set("n", "<LEFT>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<DOWN>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<UP>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<RIGHT>", "<C-w>l", { desc = "Go to Right Window", remap = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escapse terminal mode", remap = false })

-- Code navigations
vim.keymap.set("n", "gb", "<C-o>", { desc = "Goto prev position" })
vim.keymap.set("n", "gf", "<C-i>", { desc = "Goto next position" })

-- Buffer navigations
vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
