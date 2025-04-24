{ ... }:
{
  extraConfigLuaPre = # lua
    ''
      -- reduce press to enter messages
      vim.opt.shortmess:remove("F")
      vim.opt.shortmess:append("c")

      -- try to show numbers on first window open
      vim.wo.number = true
      vim.wo.signcolumn = "yes"
    '';

  extraConfigLua = # lua
    ''
      require("telescope").load_extension("lazygit")
      require("outline").setup()

      local cmp = require("cmp")

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        sources = {
          { name = "buffer" },
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        }),
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    '';
}
