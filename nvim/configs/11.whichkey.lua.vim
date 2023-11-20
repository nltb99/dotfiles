lua << EOF

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- This func to check if the current file has a specific extension
local function has_extension(extension)
    return vim.fn.expand('%:e') == extension
end

-- This func to format file based on file extension (python, js, ts)
function common_format()
    if has_extension('py') then
        local root_dir = vim.fn.finddir('pyproject.toml', '.;')

        if root_dir ~= '' and vim.fn.filereadable(root_dir .. '/pyproject.toml') then
            -- Run Black formatter with Poetry
            vim.fn.system('poetry run black .')
        else
            -- Run plain Black formatter
            vim.fn.system('black .')
        end
    elseif has_extension('ts') or has_extension('tsx') or has_extension('js') or has_extension('jsx') then
        local file_path = vim.fn.expand('%:p')  -- Get the full path of the current file
        local cmd = string.format("prettier --write --ignore-path .gitignore %s", file_path)
        vim.fn.system(cmd)
    else
        -- Run LSP format for other file types
        vim.lsp.buf.format{async=true}
    end
end

-- This func to format file using eslint
function eslint_format()
    if has_extension('ts') or has_extension('tsx') or has_extension('js') or has_extension('jsx') then
        local file_path = vim.fn.expand('%:p')  -- Get the full path of the current file
        local cmd = string.format("eslint --fix --ignore-path .gitignore %s", file_path)
        vim.fn.system(cmd)
    end
end


local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files()<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["h"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },

  p = {
    name = "Vim Plug",
    i = { "<cmd>PlugInstall<cr>", "Install" },
    s = { "<cmd>PlugStatus<cr>", "Status" },
    u = { "<cmd>PlugUpdate<cr>", "Update" },
    c = { "<cmd>PlugClean<cr>", "Clean" },
  },

  g = {
    name = "Git",
    l = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    s = { ":Telescope git_status<cr>", "Git status" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics<cr>",
      "Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { '<cmd>lua common_format()<CR>', "Format" },
    E = { '<cmd>lua eslint_format()<CR>', "Eslint format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    -- q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    -- r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    -- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    -- S = {
    --   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --   "Workspace Symbols",
    -- },
  },

  s = {
    name = "Search",
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  S = {
    name = "Spectre",
    s = { "<cmd>lua require('spectre').open()<cr>", "Search & Replace" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>","Search current word" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    i = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    s = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  k = {
    name = "Other",
    p = { ":MarkdownPreview<cr>", "Markdown Preview" },
    c = { "<cmd>!code .<cr>", "VSCode" },
    u = { "<cmd>:UndotreeToggle<cr>", "UndoTree Toggle" },
    U = { "<cmd>:UndotreePersistUndo<cr>", "UndoTree Clear" },
    a = { "<cmd>:AnyJump<cr>", "AnyJump" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

which_key.setup(setup)
which_key.register(mappings, opts)


EOF