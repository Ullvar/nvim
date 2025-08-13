return function()
  require("nvim-tree").setup({
    view = {
      width = 65,
      relativenumber = true
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  })
end
