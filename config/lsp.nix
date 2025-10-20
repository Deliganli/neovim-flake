{
  pkgs,
  lib,
  ...
}:
{
  lsp = {
    inlayHints.enable = true;

    servers = {
      ts_ls.enable = true; # TS/JS
      cssls.enable = true; # CSS
      tailwindcss.enable = true; # TailwindCSS
      html.enable = true; # HTML
      pyright.enable = true; # Python
      marksman.enable = true; # Markdown
      dockerls.enable = true; # Docker
      bashls.enable = true; # Bash
      clangd.enable = true; # C/C++
      yamlls.enable = true; # YAML
      jsonls.enable = true; # Json
      ansiblels.enable = true; # Ansible
      jdtls.enable = true; # Java
      tinymist.enable = true; # Typst
      taplo.enable = true; # TOML

      rust_analyzer = {
        enable = true;

        # make rust-analyzer to be read from the shell
        # so that tool-chain being newer is not a problem
        package = null;
      };

      metals = {
        enable = true;
        package = null;
        settings = {
          init_options = {
            statusBarProvider = "on";
          };
        };
      };

      lua_ls = {
        enable = true;
        settings.telemetry.enable = false;
      };

      # Nix
      nixd = {
        enable = true;
        settings =
          let
            # TODO - find out how to make those option
            host = "hors";
            system = pkgs.system;
            flakeOf = dir: "(builtins.getFlake \"/home/deliganli/projects/deliganli/${dir}\")";
          in
          {
            settings.nixd = {
              nixpkgs = {
                expr = "import ${flakeOf "nix"}.inputs.nixpkgs { }";
              };
              options = rec {
                nixos.expr = "${flakeOf "nix"}.nixosConfigurations.${host}.options";
                nixvim.expr = "${flakeOf "neovim-flake"}.nixvimConfigurations.${system}.default.options";
                home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
              };
            };
          };
      };
    };

    keymaps = [
      {
        key = "K";
        lspBufAction = "hover";
      }
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gD";
        lspBufAction = "declaration";
      }
      {
        key = "gR";
        lspBufAction = "references";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        key = "<leader>rk";
        lspBufAction = "format";
      }
      {
        key = "<leader>rn";
        lspBufAction = "rename";
      }
      {
        key = "<leader>ca";
        lspBufAction = "code_action";
      }
      {
        key = "<leader>sh";
        lspBufAction = "signature_help";
      }
      {
        key = "<leader>ee";
        action.__raw = "vim.diagnostic.open_float";
      }
      {
        key = "<leader>aa";
        action.__raw = "vim.diagnostic.setqflist";
      }
      {
        key = "grr";
        action.__raw = ''require('fzf-lua').lsp_references'';
        options.desc = "LSP references";
      }
      {
        key = "[c";
        action.__raw = "function() vim.diagnostic.jump({ count=-1, float=true, wrap = false }) end";
      }
      {
        key = "]c";
        action.__raw = "function() vim.diagnostic.jump({ count=1, float=true, wrap = false }) end";
      }
      {
        key = "<leader>lr";
        action = "<CMD>LspRestart<Enter>";
      }
      {
        key = "<leader>ae";
        action.__raw = ''function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) end'';
        options.desc = "errors";
      }
      {
        key = "<leader>aw";
        action.__raw = ''function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN }) end'';
        options.desc = "warnings";
      }
      {
        key = "<leader>cl";
        action = "vim.lsp.codelens.run";
        options.desc = "run codelens";
      }
      {
        key = "<leader>ds";
        action.__raw = ''require('fzf-lua').lsp_document_symbols'';
        options.desc = "document symbols";
      }
      {
        key = "<leader>ws";
        action.__raw = ''require('fzf-lua').lsp_live_workspace_symbols'';
        options.desc = "workspace symbols";
      }
      {
        key = "<leader>lfr";
        action.__raw = ''require('fzf-lua').lsp_finder'';
        options.desc = "find everywhere";
      }
    ];
  };

  plugins = {
    none-ls = {
      enable = true;
      sources = {
        code_actions = {
          statix.enable = true;
        };
        diagnostics = {
          sqlfluff = {
            enable = true;
          };
          hadolint = {
            enable = true;
          };
          yamllint = {
            enable = true;
          };
          markdownlint = {
            enable = true;
          };
          stylelint = {
            enable = true;
          };
          write_good = {
            enable = true;
          };
          proselint = {
            enable = true;
          };
          codespell = {
            enable = true;
            settings = {
              disabled_filetypes = [
                "NvimTree"
              ];
            };
          };
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        log_level = "warn";
        default_format_opts = {
          lsp_format = "fallback";
        };
        formatters_by_ft =
          let
            scalafmt = {
              __unkeyed-1 = "scalafmt";
              lsp_format = "prefer";
            };
          in
          {
            sbt = scalafmt;
            scala = scalafmt;
            md = [ "markdownlint" ];
            json = [ "jq" ];
            lua = [ "stylua" ];
            nix = [ "nixfmt" ];
            rust = [ "rustfmt" ];
            xml = [ "xmlformat" ];
            javascript = [ "prettierd" ];
            sql = [ "sqlfluff" ];
            typ = [ "typstyle" ];
            "*" = [ "trim_whitespace" ];
          };
        formatters = {
          rustfmt = {
            command = lib.getExe pkgs.rustfmt;
          };
          markdownlint = {
            command = lib.getExe pkgs.markdownlint-cli;
          };
          jq = {
            command = lib.getExe pkgs.jq;
          };
          nixfmt = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
          prettierd = {
            command = lib.getExe pkgs.prettierd;
          };
          xmlformat = {
            command = lib.getExe pkgs.xmlformat;
          };
          shellcheck = {
            command = lib.getExe pkgs.shellcheck;
          };
          shellharden = {
            command = lib.getExe pkgs.shellharden;
          };
          squeeze_blanks = {
            command = lib.getExe' pkgs.coreutils "cat";
          };
          scalafmt = {
            command = lib.getExe pkgs.scalafmt;
          };
          sqlfluff = {
            command = lib.getExe pkgs.sqlfluff;
          };
          shfmt = {
            command = lib.getExe pkgs.shfmt;
            prepend_args = [
              "-i"
              "2"
              "-ci"
            ];
          };
          stylua = {
            command = lib.getExe pkgs.stylua;
            prepend_args = [
              "--indent-type"
              "Spaces"
              "--indent-width"
              "2"
              "--column-width"
              "120"
            ];
          };
          typstyle = {
            command = lib.getExe pkgs.typstyle;
            prepend_args = [ "--inplace" ];
          };
        };
      };
    };

    lspkind = {
      enable = true;
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
