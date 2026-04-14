# meadow.nvim

A Neovim colorscheme inspired by the [Base2Tone Meadow Dark](https://github.com/atelierbram/Base2Tone-kitty) kitty theme by Bram de Haan — a duotone palette pairing slate blue with lime green.

## Preview

| Role         | Color                                                |
| ------------ | ---------------------------------------------------- |
| Background   | `#192834` slate blue                                 |
| Foreground   | `#7b9eb7` muted blue                                 |
| Keywords     | `#4299d7` / `#47adf5` sky blue                       |
| Functions    | `#8cdd3c` lime green                                 |
| Strings      | `#80bf40` grass green                                |
| Search       | `#a6f655` bright lime                                |
| Constants    | `#afddfe` pale blue                                  |

## Requirements

- Neovim `>= 0.8` (uses `vim.api.nvim_set_hl`)
- `termguicolors` enabled (the colorscheme sets it automatically)

## Installation

**[lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
{
  "simoneSantoni/meadow.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("meadow").setup({})
    vim.cmd.colorscheme("meadow")
  end,
}
```

**[packer.nvim](https://github.com/wbthomason/packer.nvim)**

```lua
use({
  "simoneSantoni/meadow.nvim",
  config = function()
    vim.cmd.colorscheme("meadow")
  end,
})
```

**[vim-plug](https://github.com/junegunn/vim-plug)**

```vim
Plug 'simoneSantoni/meadow.nvim'
" after plug#end():
colorscheme meadow
```

## Usage

Minimal:

```lua
vim.cmd.colorscheme("meadow")
```

With options:

```lua
require("meadow").setup({
  transparent = false,       -- set background to NONE
  italic_comments = true,    -- italicize comments
  overrides = {              -- override any highlight group
    Comment = { fg = "#6a8aa0", italic = false },
    ["@function"] = { fg = "#a6f655", bold = true },
  },
})
vim.cmd.colorscheme("meadow")
```

## Options

| Option            | Type      | Default | Description                                   |
| ----------------- | --------- | ------- | --------------------------------------------- |
| `transparent`     | `boolean` | `false` | Disable the background (terminal shows through) |
| `italic_comments` | `boolean` | `true`  | Render comments in italic                     |
| `overrides`       | `table`   | `{}`    | Map of highlight-group → spec; merged on top  |

## Supported plugins

Highlight groups are defined for:

- Core editor UI, syntax, diff, spell, LSP, diagnostics
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)

`:terminal` colors are set to match the upstream kitty palette.

## Credits

- [Bram de Haan](https://github.com/atelierbram) — original Base2Tone Meadow palette
- Base2Tone is licensed MIT

## License

MIT — see [LICENSE](LICENSE).
