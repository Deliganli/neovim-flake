{ ... }:
{
  plugins = {
    fzf-lua = {
      enable = true;
      settings = {
        keymap = {
          builtin = {
            __unkeyed-1 = true;
            "<C-d>" = "preview-page-down";
            "<C-u>" = "preview-page-up";
          };
        };
      };

      keymaps = {
        "<leader>ff" = {
          action = "files";
          options = {
            desc = "Files";
          };
        };
        "<leader>fr" = {
          action = "live_grep_glob";
          options = {
            desc = "Live grep";
          };
        };
        "<leader>fb" = {
          action = "buffers";
          options = {
            desc = "Buffers";
          };
        };
        "<leader>fl" = {
          action = "blines";
          options = {
            desc = "Buffer lines";
          };
        };
      };
    };
  };

  keymaps = [
    {
      action = "<cmd>FzfLua<cr>";
      key = "<leader>fz";
      options = {
        desc = "FzfLua menu";
      };
    }
  ];
}
