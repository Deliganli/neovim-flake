{ ... }:
{
  globals.mapleader = ",";

  enableMan = true;

  globalOpts = {
    number = true; # Display the absolute line number of the current line
    relativenumber = true; # Relative line numbers
    signcolumn = "yes"; # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    showmatch = true;
    updatetime = 100; # Faster completion
    clipboard = "unnamedplus"; # System clipboard, needs xclip/wl-clipboard
    cursorline = true; # Highlight the current line
    ruler = true; # Show line and column when searching
    gdefault = true; # Global substitution by default
    scrolloff = 10; # X lines away from the top/bottom
    sidescrolloff = 8; # X lines away from the left/right
    termguicolors = true; # 24-bit RGB
    list = true; # Show tab, trailing spaces etc
    spell = true; # Spellcheck
    laststatus = 3; # Always visible

    # Search
    ignorecase = true;
    smartcase = true;

    # Configure how new splits should be opened
    splitbelow = true;
    splitright = true;

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 2;
    shiftwidth = 2;
    shiftround = true;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;

    # Have a better completion experience
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];
  };

  diagnostics = {
    update_in_insert = true;
    severity_sort = true;
    virtual_text = true;

    float = {
      border = "rounded";
    };
  };

  userCommands = {
    Q = {
      command = "q";
      bang = true;
    };
  };

  filetype = {
    extension = {
      jinja = "jinja";
      jinja2 = "jinja";
      j2 = "jinja";
    };
  };

  autoCmd = [
    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "**/{ansible,playbooks}/**.{yml,yaml}"
      ];
      command = "set filetype=yaml.ansible";
    }
  ];

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
