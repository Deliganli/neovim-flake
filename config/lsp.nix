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
        config = {
          init_options = {
            statusBarProvider = "on";
          };

          settings = {
            metals = {
              defaultBspToBuildTool = true;
              enableSemanticHighlighting = true;
              enableBestEffort = true;
              autoImportBuild = "all";

              excludedPackages = [
                "akka.actor.typed.javadsl"
                "org.apache.pekko.actor.typed.javadsl"
                "com.github.swagger.akka.javadsl"
              ];

              inlayHints = {
                hintsXRayMode.enable = true;
                inferredTypes.enable = true;
                closingLabels.enable = true;
              };
            };
          };
        };
      };

      lua_ls = {
        enable = true;
        config.telemetry.enable = false;
      };

      # Nix
      nixd = {
        enable = true;
        # They are defined in the system settings in another flake, something like below
        # https://github.com/khaneliman/khanelinix
        # https://github.com/khaneliman/khanelinix/blob/0fb63d065277c9b4acfc8f21a222db38bc4079df/modules/home/programs/terminal/editors/neovim/default.nix
        # config =
        #   let
        #     host = "my-host-name";
        #     system = pkgs.system;
        #     flakeOf = dir: "(builtins.getFlake \"/my-repos/${dir}\")";
        #     nixDir = flakeOf "projects/nix";
        #   in
        #   {
        #     settings.nixd = {
        #       nixpkgs = {
        #         expr = "import ${nixDir}.inputs.nixpkgs { }";
        #       };
        #       options = rec {
        #         nix-darwin.expr = "${nixDir}.darwinConfigurations.${host}.options";
        #         nixvim.expr = "${flakeOf "this-neovim-flake-dir"}.nixvimConfigurations.${system}.default.options";
        #         home-manager.expr = "${nix-darwin.expr}.home-manager.users.type.getSubOptions [ ]";
        #       };
        #     };
        #   };
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
  };
}
