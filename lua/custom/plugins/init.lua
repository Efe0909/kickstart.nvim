return {
  -- smooth scroll
  -- 1. Accelerate j/k
  {
    'rainbowhxch/accelerated-jk.nvim',
    keys = { 'j', 'k' }, -- load on the first press
    opts = {
      mode = 'time_driven', -- smooth regardless of key-repeat rate
      acceleration_limit = 200,
      acceleration_table = { 2, 4, 8, 12, 16, 20 },
    },
  },
  -- 2. Page-level tweening
  {
    'karb94/neoscroll.nvim',
    event = 'WinScrolled',
    opts = {
      easing_function = 'quadratic', -- or "sine", "circular", …
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = true,
    },
  },
}
