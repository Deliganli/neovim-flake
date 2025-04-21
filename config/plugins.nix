{ pkgs, ... }:
{
  plugins = {
    barbar = {
      enable = true;
      settings = {
        animation = false;
      };
    };

    barbecue = {
      enable = true;
      settings = {
        theme = "default";
      };
    };

    snacks = {
      enable = true;
      settings = {
        bigfile = {
          enabled = true;
        };
      };
    };

    indent-blankline = {
      enable = true;
    };

    web-devicons.enable = true;

    twilight.enable = true;

    colorizer = {
      enable = true;
    };

    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "onedark";
        };
      };
    };

    # Includes all parsers for treesitter
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
        };
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "gnn";
            node_incremental = "grn";
            node_decremental = "grm";
            scope_incremental = "grc";
          };
        };
      };
    };

    ts-autotag = {
      enable = true;
    };

    nvim-autopairs = {
      enable = true;
    };

    lazygit = {
      enable = true;
      settings = {
        floating_window_scaling_factor = 1;
      };
    };

    auto-session = {
      enable = true;
    };

    trouble = {
      enable = true;
    };

    luasnip = {
      enable = true;
      # fromVscode = [ { } ];
      settings = {
        extraConfig = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
    };

    comment = {
      enable = true;
    };

    gitsigns = {
      enable = true;
    };

    gitlinker = {
      enable = true;
    };

    grug-far = {
      enable = true;
    };

    which-key = {
      enable = true;
      settings = {
        # breaking some stuff when shows up
        delay = 1000;
      };
    };

    markdown-preview = {
      enable = true;
      settings.theme = "dark";
    };

    markview = {
      enable = true;
    };

    plantuml-syntax = {
      enable = true;
    };

    nvim-bqf = {
      enable = true;
    };

    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
        live-grep-args = {
          enable = true;
          settings = {
            auto_quoting = true;
            mappings = {
              i = {
                "<C-j>" = {
                  __raw = ''
                    require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " })
                  '';
                };
                "<C-k>" = {
                  __raw = ''
                    require("telescope-live-grep-args.actions").quote_prompt()
                  '';
                };
                "<C-space>" = {
                  __raw = ''
                    require("telescope.actions").to_fuzzy_refine
                  '';
                };
              };
            };
          };
        };
      };
    };

    nvim-tree = {
      enable = true;
      disableNetrw = true;
      hijackCursor = true;
      diagnostics = {
        enable = true;
      };
      filesystemWatchers = {
        enable = true;
      };
      git = {
        enable = true;
      };
      view = {
        width = 60;
        relativenumber = true;
      };
      renderer = {
        highlightOpenedFiles = "all";
        indentMarkers = {
          enable = true;
        };
      };
    };

    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
        SplitWidth = 60;
      };
    };

    illuminate = {
      enable = true;
      filetypesDenylist = [
        "Outline"
        "TelescopePrompt"
        "alpha"
        "reason"
      ];
    };

    schemastore = {
      enable = true;
      yaml.enable = false; # yamlls lsp requires this
      json.enable = true;
    };

    fidget = {
      enable = true;
      settings = {
        notification = {
          override_vim_notify = true;
        };
        integration = {
          nvim-tree.enable = true;
        };
      };
    };

    friendly-snippets = {
      enable = true;
    };
  };

  colorschemes.onedark = {
    enable = true;
    settings = {
      style = "warmer";
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    quick-scope
    clipboard-image-nvim
    outline-nvim
  ];
}
