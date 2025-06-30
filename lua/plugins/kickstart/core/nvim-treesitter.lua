return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    -- ░░  Incremental selection  ░░
    incremental_selection = {
      enable = true,
      -- Tweak the keys if you like; these are the Treesitter defaults.
      keymaps = {
        init_selection = 'gnn', -- start selecting at cursor node
        node_incremental = 'grn', -- grow to next “named” node
        scope_incremental = 'grc', -- grow to next scope  (function, if…)
        node_decremental = 'grm', -- shrink selection
      },
    },
  },

  -- extra runtime tweaks that Lazy.nvim runs *after* setup()
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)

    -- ── code-aware folding ───────────────────────────────────────────
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldenable = true -- keep folding on
    vim.opt.foldlevel = 99 -- but start with all open
    vim.opt.foldlevelstart = 99
    vim.opt.foldcolumn = '1' -- little gutter to show folds
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
