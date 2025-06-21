-- LazyVim default keymaps
-- https://github.com/LazyVim/LazyVim/blob/63150fa4c5ec8a6f5c56e9035599a8c8e32dc8ed/lua/lazyvim/config/keymaps.lua#L5
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- LSP
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart LSP Server" })

-- Git
vim.keymap.set({ "n", "x" }, "<leader>gb", Snacks.picker.git_branches, { desc = "Git branches" })
vim.keymap.set({ "n", "x" }, "<leader>go", function()
  Snacks.gitbrowse()
end, { desc = "Perm Link" })
vim.keymap.set({ "n", "x" }, "<leader>gp", function()
  ---@diagnostic disable-next-line: missing-fields
  Snacks.gitbrowse({
    open = function(url)
      vim.fn.setreg("+", url)
    end,
  })
end, { desc = "Perm Link (copy)" })
vim.keymap.set("n", "<leader>gn", require("neogit").open, { desc = "Neogit" })

-- Debugging
vim.keymap.set("n", "<leader>dO", require("dap").step_out, { desc = "Step Out" })
vim.keymap.set("n", "<leader>do", require("dap").step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>dg", require("dap").continue, { desc = "Go!" })

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

-- Utils
vim.keymap.set({ "n", "x" }, "zs", Snacks.picker.spelling, { desc = "Spelling suguestions" })
