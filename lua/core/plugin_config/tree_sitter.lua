return function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go", "gomod", "gosum", "gowork", "python", "typescript", "terraform", "markdown", "markdown_inline", "dockerfile", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "hjson", "json", "json5", "jsdoc", "jq", "make", "proto", "rust", "sql", "ssh_config", "tmux", "toml", "xml", "yaml", "zig", "bash", "diff" },
        sync_install = false,
        indent = {
            enable = false
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    })
end
