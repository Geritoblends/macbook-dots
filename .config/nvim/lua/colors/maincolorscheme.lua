-- lua/colors/maincolorscheme.lua

local M = {}

function M.setup()
    local hl = vim.api.nvim_set_hl
    local palette = {
        bg = "NONE",
        fg = "#f2f4f8",        -- base05
        red = "#ee5396",       -- base0A
        green = "#42be65",     -- base0D
        yellow = "#be95ff",    -- base0E (purple accent)
        blue = "#33b1ff",      -- base0B
        purple = "#be95ff",    -- base0E
        aqua = "#3ddbd9",      -- base08
        orange = "#ee5396",    -- base0A (matches red)
        gray = "#525252",      -- base03
        dark_gray = "#393939", -- base02
    }

    -- Base
    hl(0, "Normal", { fg = palette.fg, bg = palette.bg })
    hl(0, "NormalNC", { fg = palette.fg, bg = palette.bg })
    hl(0, "LineNr", { fg = palette.gray, bg = palette.bg })
    hl(0, "CursorLine", { bg = palette.dark_gray })
    hl(0, "CursorLineNr", { fg = palette.yellow, bold = true, bg = palette.bg })
    hl(0, "Visual", { bg = palette.dark_gray })
    hl(0, "SignColumn", { bg = palette.bg })
    hl(0, "StatusLine", { fg = palette.fg, bg = palette.bg })
    hl(0, "StatusLineNC", { fg = palette.gray, bg = palette.bg })
    hl(0, "VertSplit", { fg = palette.dark_gray, bg = palette.bg })

    -- Float/Popup windows
    hl(0, "NormalFloat", { fg = palette.fg, bg = palette.dark_gray })
    hl(0, "FloatBorder", { fg = palette.gray, bg = palette.dark_gray })

    -- Treesitter and Syntax
    hl(0, "Comment", { fg = palette.gray, italic = true })
    hl(0, "Keyword", { fg = palette.purple })
    hl(0, "Function", { fg = palette.green })
    hl(0, "String", { fg = palette.aqua })
    hl(0, "Constant", { fg = palette.orange })
    hl(0, "Type", { fg = palette.blue })
    hl(0, "Identifier", { fg = palette.yellow })
    hl(0, "Number", { fg = palette.orange })

    -- Lualine
    hl(0, "lualine_a_normal", { fg = "#161616", bg = palette.yellow, bold = true }) -- Purple accent
    hl(0, "lualine_a_insert", { fg = "#161616", bg = palette.blue, bold = true })
    hl(0, "lualine_a_visual", { fg = "#161616", bg = palette.purple, bold = true })
    hl(0, "lualine_b_normal", { fg = palette.green, bg = palette.bg })  -- Git branch
    hl(0, "lualine_c_normal", { fg = palette.fg, bg = palette.bg })     -- Filename
    hl(0, "lualine_x_normal", { fg = palette.aqua, bg = palette.bg })   -- Filetype
    hl(0, "lualine_z_normal", { fg = palette.orange, bg = palette.bg }) -- Location

    -- Inactive buffers
    hl(0, "lualine_c_inactive", { fg = palette.gray, bg = palette.bg })
    hl(0, "lualine_x_inactive", { fg = palette.gray, bg = palette.bg })

    -- Diagnostics
    hl(0, "lualine_diagnostics_error_normal", { fg = palette.red, bg = palette.bg })
    hl(0, "lualine_diagnostics_warn_normal", { fg = palette.orange, bg = palette.bg })

    -- Terminal
    hl(0, "TermCursor", { reverse = true })
end

return M
