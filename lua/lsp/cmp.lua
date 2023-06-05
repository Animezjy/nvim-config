local cmp = require("cmp")

cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- 补全源
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- For vsnip users.
    { name = "vsnip" },

    -- For luasnip users.
    { name = 'luasnip' },

    --For ultisnips users.
    -- { name = 'ultisnips' },

    -- -- For snippy users.
    -- { name = 'snippy' },
  }, 
  { { name = "buffer" }, { name = "path" } }),

  -- 快捷键设置
  mapping = require("config.mappings").cmp(cmp),
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

