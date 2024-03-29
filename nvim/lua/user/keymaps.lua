local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- <C> = Control
-- <S> = Shift
-- <A> = Alt / Option in Mac

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Navigate splits
keymap("n", "<A-Up>", "<C-k>", opts)
keymap("n", "<A-Down>", "<C-j>", opts)
keymap("n", "<A-Left>", "<C-h>", opts)
keymap("n", "<A-Right>", "<C-l>", opts)

-- NvimTree
-- Press "Tab" to focus to NVimTree, press "e" again to toggle
keymap("n", "<Tab>", ":NvimTreeFocus<CR>", opts) 

-- Clear highlight search
keymap("n", "<ESC>", ":nohl<CR>", opts)

-- Search Text, <Space>st
keymap(
	"n",
	"<leader>st",
	":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({}))<cr>",
	opts
)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "ww", "<ESC>:w<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Buffer Jump
keymap("n", ",1", ":BufferLineGoToBuffer 1<CR>",  opts)
keymap("n", ",2", ":BufferLineGoToBuffer 2<CR>",  opts)
keymap("n", ",3", ":BufferLineGoToBuffer 3<CR>",  opts)
keymap("n", ",4", ":BufferLineGoToBuffer 4<CR>",  opts)
keymap("n", ",5", ":BufferLineGoToBuffer 5<CR>",  opts)
keymap("n", ",6", ":BufferLineGoToBuffer 6<CR>",  opts)
keymap("n", ",7", ":BufferLineGoToBuffer 7<CR>",  opts)
keymap("n", ",8", ":BufferLineGoToBuffer 8<CR>",  opts)
keymap("n", ",9", ":BufferLineGoToBuffer 9<CR>",  opts)
-- keymap("n", "<A-lt>", ":BufferLineMovePrev<CR>",  opts)
-- keymap("n", "<M-<", ":BufferLineMoveNext<CR>",  opts)
keymap("n", ",w", "<cmd>Bdelete!<CR>", opts)


-- Pasting without yanking
keymap("v", "p", '"_dP', opts)

-- -- Format code
-- keymap("x", "<leader>fm", ":lua vim.lsp.buf.range_formatting()", opts)

-- -- Format code
-- -- keymap("n", "<leader>fm", ":lua vim.lsp.buf.formatting_sync()", opts)
-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])


-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Telescope
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
keymap("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)
keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts)
keymap("n", "gsy", ":Telescope lsp_document_symbols<CR>", opts)
