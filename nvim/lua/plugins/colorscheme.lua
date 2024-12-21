return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                term_colors = true,
                transparent_background = false,
                no_italic = true,
            })
            --vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.moonflyItalics = false
            vim.cmd.colorscheme("moonfly")
        end
    },
}
