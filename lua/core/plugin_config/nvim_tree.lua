require("nvim-tree").setup({
  view = {
    width = 100,
    relativenumber = true
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})