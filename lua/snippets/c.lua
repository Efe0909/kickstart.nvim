return {
  -- Include guard with filename as macro
  s(
    'guard',
    fmt(
      [[
    #ifndef {GUARD}
    #define {GUARD}

    {}

    #endif // {GUARD}
  ]],
      {
        GUARD = f(function(_, snip)
          local name = snip.env.TM_FILENAME or 'HEADER_H'
          name = name:upper():gsub('%.', '_')
          return name
        end, {}),
        i(1),
      }
    )
  ),

  -- Pragma once
  s('once', {
    t '#pragma once',
  }),

  -- Function declaration
  s(
    'func',
    fmt(
      [[
    {ret} {name}({args});
  ]],
      {
        ret = i(1, 'void'),
        name = i(2, 'function_name'),
        args = i(3, 'void'),
      }
    )
  ),
}
