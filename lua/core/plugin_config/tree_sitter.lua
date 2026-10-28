return function()
  require("nvim-treesitter").install({
    "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
    "javascript", "html", "go", "gomod", "gosum", "gowork",
    "python", "typescript", "tsx", "terraform", "markdown",
    "markdown_inline", "dockerfile", "git_config", "git_rebase",
    "gitattributes", "gitcommit", "gitignore", "helm", "hjson",
    "json", "json5", "jsdoc", "jq", "make", "proto", "rust",
    "sql", "ssh_config", "tmux", "toml", "xml", "yaml", "zig",
    "bash", "diff",
  })

  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
      local ok, query = pcall(vim.treesitter.query.get, lang, "highlights")
      if lang and ok and query then
        pcall(vim.treesitter.start, args.buf, lang)
      end
    end,
  })
end
