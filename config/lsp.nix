{
  pkgs,
  lib,
  ...
}:
{
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
          # prose/spelling
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
        # completion = {
        #   luasnip.enable = true;
        # };
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
            # this needs .sqlfluff file to exist in one of the parent directories
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

    lsp = {
      enable = true;
      inlayHints = true;

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

        metals = {
          enable = true;
          extraOptions = {
            init_options = {
              statusBarProvider = "on";
            };
          };
        };

        # TOML
        taplo = {
          enable = true;
          # root_dir.__raw = ''
          #   require("lspconfig.util").root_pattern('*.toml', '.git')
          # '';
        };

        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };

        # Nix
        nixd = {
          enable = true;
          extraOptions = {
            offset_encoding = "utf-8";
          };
          settings =
            let
              # TODO - find out how to make those option
              host = "hors";
              system = pkgs.system;
              flakeOf = dir: ''(builtins.getFlake "/home/deliganli/projects/deliganli/${dir}")'';
            in
            {
              nixpkgs = {
                expr = "import ${flakeOf "nix"}.inputs.nixpkgs { }";
              };
              options = rec {
                nixos.expr = ''${flakeOf "nix"}.nixosConfigurations.${host}.options'';
                nixvim.expr = ''${flakeOf "neovim-flake"}.nixvimConfigurations.${system}.default.options'';
                home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
                microvm.expr = "${flakeOf "nix"}.inputs.microvm.outputs.nixosModules.microvm-options";
              };
            };
        };
      };

      keymaps = {
        diagnostic = {
          "<leader>ee" = "open_float";
          "<leader>aa" = "setqflist";
        };
        lspBuf = {
          K = "hover";
          grr = "references";
          gd = "definition";
          gD = "declaration";
          gi = "implementation";
          gt = "type_definition";
          "<leader>rk" = "format";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
          "<leader>sh" = "signature_help";
        };
        extra = [
          {
            key = "[c";
            action.__raw = ''
              function()
                vim.diagnostic.goto_prev({ wrap = false })
              end
            '';
            options.desc = "prev diagnostic";
          }
          {
            key = "]c";
            action.__raw = ''
              function()
                vim.diagnostic.goto_next({ wrap = false })
              end
            '';
            options.desc = "next diagnostic";
          }
          {
            key = "<leader>ae";
            action.__raw = ''
              function()
                vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
              end
            '';
            options.desc = "errors";
          }
          {
            key = "<leader>aw";
            action.__raw = ''
              function()
                vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
              end
            '';
            options.desc = "warnings";
          }
          {
            key = "<leader>lr";
            action = "<CMD>LspRestart<Enter>";
            options.desc = "restart LSP";
          }
          {
            key = "<leader>cl";
            action = "vim.lsp.codelens.run";
            options.desc = "run codelens";
          }
          {
            key = "<leader>ds";
            action.__raw = ''
              require('fzf-lua').lsp_document_symbols
            '';
            options.desc = "document symbols";
          }
          {
            key = "<leader>ws";
            action.__raw = ''
              require('fzf-lua').lsp_live_workspace_symbols
            '';
            options.desc = "workspace symbols";
          }
          {
            key = "<leader>grr";
            action.__raw = ''
              require('fzf-lua').lsp_references
            '';
            options.desc = "LSP references";
          }
        ];
      };
    };

    lspkind = {
      enable = true;
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };

    # TODO - revisit below, doesn't work with lspconfig scala plugin
    # Debugger
    dap = {
      enable = true;
      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];
        scala = [
          {
            type = "scala";
            request = "launch";
            name = "RunOrTest";
            metals = {
              runType = "runOrTestFile";
              # args = [] "firstArg" "secondArg" "thirdArg" ]; -- here just as an example
            };
          }
          {
            type = "scala";
            request = "launch";
            name = "Test Target";
            metals = {
              runType = "testTarget";
            };
          }
        ];
      };
    };

    dap-python = {
      enable = true;
    };

    dap-ui = {
      enable = true;
    };

    dap-virtual-text = {
      enable = true;
    };
  };
}
