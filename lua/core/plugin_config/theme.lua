require('tokyonight').setup({
  transparent = true,
  style = "night",
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer", "nvimtree" },
})

vim.cmd [[colorscheme tokyonight-night]]

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
  bg = "none",
})

hl("ColorColumn", {
  ctermbg = 0,
  bg = "#555555",
})

hl("CursorLineNR", {
  bg = "None"
})

hl("Normal", {
  bg = "none"
})

hl("LineNr", {
  fg = "#5eacd3"
})

hl("netrwDir", {
  fg = "#5eacd3"
})

