return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "tsx", "c", "lua", "rust",
                "jsdoc", "bash", "python",
            },
            sync_install = false,
            auto_install = true,
        })

        vim.treesitter.language.register("templ", "templ")
    end
}
