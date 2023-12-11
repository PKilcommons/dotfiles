--local highlight = {"CursorColumn", "Whitespace"}
return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  main = "ibl",
  opts = {
    indent = {
      char = "·",
      smart_indent_cap = false,
      --highlight = highlight,
    },
    whitespace = {
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
  },
}
