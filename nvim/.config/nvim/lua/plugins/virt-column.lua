-- Create a highlight group for the plugin that matches the colour I use in VSCode.
-- See here for details on what highlight groups are:
-- https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#696969" })
return {
  "lukas-reineke/virt-column.nvim",
  opts = {highlight = "VirtColumn"},
}
