vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps --

-- Switch line numbers mode
vim.keymap.set("n", "<leader>mn", "<cmd>ToggleLineNumbersMode<CR>", { desc = "Toggle line numbers mode" })

-- Better save and exit
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and exit" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Quit" })

-- Clear search highlights
keymap.set("n", "<leader>mh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better delete single character
keymap.set("n", "x", '"_x')

-- Better increment and decrement
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
