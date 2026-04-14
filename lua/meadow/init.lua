local M = {}

M.config = {
  transparent = false,
  italic_comments = true,
  overrides = {},
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "meadow"
  vim.o.background = "dark"

  local palette = require("meadow.palette")
  local c = palette.colors

  if M.config.transparent then
    c = vim.tbl_extend("force", c, { bg = "NONE", bg_alt = "NONE" })
  end

  local groups = require("meadow.highlights").get(c)

  if not M.config.italic_comments then
    groups.Comment.italic = false
  end

  for name, opts in pairs(M.config.overrides) do
    groups[name] = vim.tbl_extend("force", groups[name] or {}, opts)
  end

  for name, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  -- Terminal colors mirroring the kitty palette
  vim.g.terminal_color_0  = "#192834"
  vim.g.terminal_color_1  = "#277fbe"
  vim.g.terminal_color_2  = "#80bf40"
  vim.g.terminal_color_3  = "#a6f655"
  vim.g.terminal_color_4  = "#4299d7"
  vim.g.terminal_color_5  = "#80bf40"
  vim.g.terminal_color_6  = "#47adf5"
  vim.g.terminal_color_7  = "#7b9eb7"
  vim.g.terminal_color_8  = "#3d5e76"
  vim.g.terminal_color_9  = "#8cdd3c"
  vim.g.terminal_color_10 = "#223644"
  vim.g.terminal_color_11 = "#335166"
  vim.g.terminal_color_12 = "#466b86"
  vim.g.terminal_color_13 = "#afddfe"
  vim.g.terminal_color_14 = "#73b234"
  vim.g.terminal_color_15 = "#d1ecff"
end

return M
