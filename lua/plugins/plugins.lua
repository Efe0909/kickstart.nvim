return {
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  --
  -- require 'plugins.kickstart.extra.debug',
  require 'plugins.kickstart.extra.indent_line',
  require 'plugins.kickstart.extra.lint',
  require 'plugins.kickstart.extra.autopairs',
  require 'plugins.kickstart.extra.neo-tree',
  require 'plugins.kickstart.extra.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  { import = 'plugins.custom' },
  { import = 'plugins.kickstart.core' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}
