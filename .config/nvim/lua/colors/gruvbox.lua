-- lua/colors/gruvbox.lua

local M = {}

function M.setup()
    local hl = vim.api.nvim_set_hl
    local palette = {
        -- bg = "#1d2021",
        bg = "NONE",
        fg = "#ebdbb2",
        red = "#fb4934",
        green = "#b8bb26",
        yellow = "#fabd2f",
        blue = "#83a598",
        purple = "#d3869b",
        aqua = "#8ec07c",
        orange = "#fe8019",
        gray = "#928374",
        dark_gray = "#3c3836",
    }

    -- Base
    hl(0, "Normal", { fg = palette.fg, bg = palette.bg })
    hl(0, "NormalNC", { fg = palette.fg, bg = palette.bg })
    hl(0, "LineNr", { fg = palette.gray, bg = palette.bg })
    hl(0, "CursorLine", { bg = palette.bg })
    hl(0, "CursorLineNr", { fg = palette.yellow, bold = true, bg = palette.bg })
    hl(0, "Visual", { bg = palette.dark_gray })
    hl(0, "SignColumn", { bg = palette.bg })
    hl(0, "StatusLine", { fg = palette.fg, bg = palette.bg })
    hl(0, "StatusLineNC", { fg = palette.gray, bg = palette.bg })
    hl(0, "VertSplit", { fg = palette.dark_gray, bg = palette.bg })

    -- Float/Popup windows
    hl(0, "NormalFloat", { fg = palette.fg, bg = "#282828" })
    hl(0, "FloatBorder", { fg = palette.gray, bg = "#282828" })

    -- Treesitter and Syntax
    hl(0, "Comment", { fg = palette.gray, italic = true })
    hl(0, "Keyword", { fg = palette.purple })
    hl(0, "Function", { fg = palette.green })
    hl(0, "String", { fg = palette.aqua })
    hl(0, "Constant", { fg = palette.orange })
    hl(0, "Type", { fg = palette.blue })
    hl(0, "Identifier", { fg = palette.yellow })
    hl(0, "Number", { fg = palette.orange })

    -- Lualine background (set theme to auto in lualine)
    hl(0, "lualine_a_normal", { fg = palette.yellow, bg = palette.bg, bold = true })
    hl(0, "lualine_a_insert", { fg = palette.blue, bg = palette.bg, bold = true })
    hl(0, "lualine_a_visual", { fg = palette.purple, bg = palette.bg, bold = true })
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



    -- Optional terminal background
    hl(0, "TermCursor", { reverse = true })
end

return M
