-- Basic settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- Plugin setup with lazy.nvim
require("lazy").setup({
    {
        "Exafunction/windsurf.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                virtual_text = {
                    enabled = true,
                    manual = false,
                    key_bindings = {
                        accept = "<M-i>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-j>",
                        prev = "<M-k>",
                        dismiss = "<M-u>",
                    },
                },


            })
        end
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- hey
        }
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            {
                'rafamadriz/friendly-snippets'
            },
        },
        version = 'v0.*',
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            signature = { enabled = true }
        },
    },

    -- nvim-tree file explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- For file icons
        },
        config = function()
            -- Disable netrw (recommended by nvim-tree)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                    },
                    highlight_git = true,
                    add_trailing = false,
                },
                filters = {
                    dotfiles = false,
                },
                git = {
                    enable = true,
                    ignore = false,
                },
            })

            -- Set up gruvbox colors for nvim-tree
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    -- Customize these colors to match gruvbox
                    vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#d5c4a1" })
                    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#fabd2f" })
                    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#ebdbb2" })
                    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#665c54" })
                    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#fe8019" })
                    vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#b8bb26" })
                    vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#fb4934" })
                    vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#83a598" })
                    vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#b8bb26" })
                    vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = "#d3869b" })
                end,
            })

            -- Key mappings for nvim-tree
            vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
            vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { silent = true })
        end,
    },

    -- Essential plugins
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "bash", "markdown", "python", "javascript", "typescript", "tsx", "html", "css" },
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
            vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
            vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
        end,
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" },
                automatic_installation = true,
            })

            -- Basic LSP setup
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {}
            lspconfig.pyright.setup {}
            -- LSP keybindings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },

    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    },

    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            })
        end,
    },
    {
        "sphamba/smear-cursor.nvim",

        opts = {
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,

            -- Smear cursor when moving within line or to neighbor lines.
            -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
            smear_between_neighbor_lines = true,

            -- Draw the smear in buffer space instead of screen space when scrolling
            scroll_buffer_space = true,

            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            -- Smears will blend better on all backgrounds.
            legacy_computing_symbols_support = false,

            -- Smear cursor in insert mode.
            -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
            smear_insert_mode = true,
        },
    }
})
-- Basic keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>rp", ":w<CR>:!poetry run python %<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rr", ":w<CR>:!Rscript %<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rg", ":w<CR>:!go run %<CR>", { noremap = true, silent = false })

-- Add this to the end of your init.lua file

-- Make terminal split always appear at the bottom
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        -- Move the terminal to the bottom
        vim.cmd("wincmd J")
        -- Enter insert mode automatically (optional)
        vim.cmd("startinsert")
    end,
})

-- Create a custom command for convenience (optional)
vim.api.nvim_create_user_command("Terminal", function()
    vim.cmd("split")
    vim.cmd("terminal")
end, {})

-- Optional keymap for quickly opening a terminal at the bottom
vim.keymap.set("n", "<leader>t", ":split | terminal<CR>", { silent = true })


-- Add this to your init.lua to make <Esc> exit terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        -- Local terminal mapping for <Esc>
        vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
})

require("colors.maincolorscheme").setup()
