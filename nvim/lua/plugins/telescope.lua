return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    fzf = {},
                },
            })
            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<C-b>", builtin.buffers, {})
            vim.keymap.set("n", "<C-h>", builtin.command_history, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>mp", builtin.man_pages, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", "venv", "__pycache__" },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
