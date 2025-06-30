# 📎 LuaSnip Snippets – Notes & Reminders

## ❗ Safe to Ignore: LSP Warnings

If your Lua language server complains about things like:

```
undefined global 's'
undefined global 't'
undefined global 'fmt'
```

Don’t worry — these are **harmless**.

LuaSnip injects these symbols at runtime when it loads your snippets.  
The language server can’t see that, so it *assumes* they’re undefined.  
Everything still functions.

Want to silence the noise anyway? Add this to your `lua_ls` setup:

```lua
require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "s", "t", "i", "f", "fmt", "c", "sn", "d" },
      },
    },
  },
})
```

---

## ✍️ Minimal Snippet Cheat‑Sheet

```lua
return {
  s("hello", fmt("Hello, {}!", { i(1, "world") }))
}
```

| Helper | Meaning            |
| ------ | ------------------ |
| `s`    | snippet            |
| `t`    | text node          |
| `i(n)` | insert node        |
| `f`    | function node      |
| `fmt`  | template formatter |

---

## 💡 Tips

* Put repeated helpers in a single module (e.g. `~/.config/nvim/lua/luasnipextra/init.lua`) to avoid boilerplate.
* Reload snippets on‑the‑fly with `:LuaSnipReloadSnippets`.
* Use `snippetType = "autosnippet"` for triggers that expand as soon as you finish typing them.

---

## 🧪 Example: Pattern‑Rule Snippet for Makefiles

```lua
s({ trig = "p2o", snippetType = "autosnippet" }, fmt([[
%.o: %.{ext}
	$({compiler}) $({flags}) -c $< -o $@
]], {
  ext      = i(1, "c"),
  compiler = f(function(args)
                return args[1][1] == "c" and "CC" or "CXX"
              end, { 1 }),
  flags    = f(function(args)
                return args[1][1] == "c" and "CFLAGS" or "CXXFLAGS"
              end, { 1 }),
}))
```

Type `p2o` in a Makefile, choose `c` or `cpp`, and the rule appears automatically.

---

📁 Keep calm and craft snippets.

