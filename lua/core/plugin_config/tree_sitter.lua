return function()
  require("nvim-treesitter").setup({
    ensure_installed = {
      "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
      "javascript", "html", "go", "gomod", "gosum", "gowork",
      "python", "typescript", "terraform", "markdown",
      "markdown_inline", "dockerfile", "git_config", "git_rebase",
      "gitattributes", "gitcommit", "gitignore", "helm", "hjson",
      "json", "json5", "jsdoc", "jq", "make", "proto", "rust",
      "sql", "ssh_config", "tmux", "toml", "xml", "yaml", "zig",
      "bash", "diff",
    },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = false,
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
      vim.bo[args.buf].syntax = ""
    end,
  })
end
