-- ~/.config/nvim/lua/plugins/luasnip_extra.lua
return {
  'L3MON4D3/LuaSnip',
  ---* Kickstart already loads LuaSnip; this block just appends config.
  config = function(_, opts)
    -- Keep any existing kickstart options intact
    require('luasnip').config.setup(opts or {})

    -- 👇 Tell LuaSnip where your hand-rolled snippets live
    require('luasnip.loaders.from_lua').load {
      paths = { vim.fn.stdpath 'config' .. '/lua/snippets' },
    }
  end,
}
