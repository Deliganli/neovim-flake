{ ... }:
{
  plugins = {
    gitsigns = {
      enable = true;
    };
  };

  keymaps = map (x: x // { options.buffer = false; }) [
    {
      mode = "n";
      key = "<leader>hb";
      action.__raw = ''function() require("gitsigns").blame_line{full=true} end'';
      options = {
        desc = "blame line";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = ''require("gitsigns").blame'';
      options = {
        desc = "blame lines";
      };
    }
    {
      mode = "n";
      key = "<leader>tb";
      action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
      options = {
        desc = "toggle blame";
      };
    }
    {
      mode = "n";
      key = "<leader>hd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options = {
        desc = "diff";
      };
    }
    {
      mode = "n";
      key = "<leader>hD";
      action.__raw = ''function() require("gitsigns").diffthis("~") end'';
      options = {
        desc = "diff";
      };
    }
    {
      mode = "n";
      key = "<leader>hp";
      action.__raw = ''require("gitsigns").preview_hunk'';
      options = {
        desc = "Preview hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>hi";
      action.__raw = ''require("gitsigns").preview_hunk_inline'';
      options = {
        desc = "Preview hunk";
      };
    }
    {
      mode = "n";
      key = "]h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({']h', bang = true})
          else
            require("gitsigns").nav_hunk('next')
          end
        end
      '';
      options = {
        desc = "next hunk";
      };
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({'[h', bang = true})
          else
            require("gitsigns").nav_hunk('prev')
          end
        end
      '';
      options = {
        desc = "prev hunk";
      };
    }
    {
      mode = [
        "o"
        "x"
      ];
      key = "ih";
      action.__raw = ''require("gitsigns").select_hunk'';
      options = {
        desc = "select hunk";
      };
    }
  ];
}
