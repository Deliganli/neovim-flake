{ ... }:
{
  keymaps = [
    # undotree
    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        desc = "Undotree";
      };
    }

    # nvim-tree
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        desc = "nvim-tree toggle";
      };
    }

    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>NvimTreeFindFile<CR>";
      options = {
        desc = "nvim-tree find file";
      };
    }

    # lazygit
    {
      mode = "n";
      key = "<leader>gl";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<cmd>LazyGitFilterCurrentFile<cr>";
      options = {
        desc = "LazyGit current file";
      };
    }

    # telescope
    {
      action.__raw = ''
        require("telescope").extensions.live_grep_args.live_grep_args
      '';
      key = "<leader>fr";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>Telescope git_bcommits<CR>";
      key = "<leader>fg";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fh";
    }
    {
      action = "<cmd>Telescope colorscheme<CR>";
      key = "<leader>ch";
    }
    {
      action = "<cmd>Telescope man_pages<CR>";
      key = "<leader>fm";
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
    }
    {
      action = "<cmd>Telescope keymaps<CR>";
      key = "<leader>fk";
    }
    {
      action = "<cmd>Telescope commands<CR>";
      key = "<leader>fc";
    }

    # auto-session
    {
      mode = "n";
      key = "<leader>ps";
      action = ''<cmd>SessionSearch<cr>'';
      options = {
        desc = "load last session";
      };
    }

    # grug-far
    {
      mode = "n";
      key = "<leader>rr";
      action = "<cmd>GrugFar<cr>";
      options = {
        desc = "search and replace";
      };
    }

    # bqf
    {
      mode = "n";
      key = "co";
      action = "<cmd>copen<cr>";
      options = {
        desc = "open quickfix";
      };
    }
    {
      mode = "n";
      key = "cq";
      action = "<cmd>cclose<cr>";
      options = {
        desc = "close quickfix";
      };
    }

    # conform
    {
      mode = "n";
      key = "<leader>rf";
      action.__raw = ''
        function()
          require("conform").format({ async = true })
        end
      '';
      options.desc = "format buffer";
    }

    # gitsigns
    {
      mode = "n";
      key = "<leader>hb";
      action.__raw = ''
        function()
          require("gitsigns").blame_line{full=true}
        end
      '';
      options.desc = "blame line";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = ''
        require("gitsigns").blame
      '';
      options.desc = "blame lines";
    }
    {
      mode = "n";
      key = "<leader>tb";
      action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
      options.desc = "toggle blame";
    }
    {
      mode = "n";
      key = "<leader>hd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options.desc = "diff";
    }
    {
      mode = "n";
      key = "<leader>hD";
      action.__raw = ''
        function()
          require("gitsigns").diffthis("~")
        end
      '';
      options.desc = "diff";
    }
    {
      mode = "n";
      key = "<leader>]c";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end
      '';
      options = {
        desc = "next hunk";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "<leader>[c";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end
      '';
      options = {
        desc = "prev hunk";
        expr = true;
      };
    }
    {
      mode = [
        "o"
        "x"
      ];
      key = "<leader>[c";
      action = "<cmd><C-U>Gitsigns select_hunk<CR> ";
      options = {
        desc = "prev hunk";
      };
    }

    # barbar
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>BufferClose!<cr>";
      options = {
        desc = "force delete buffer";
      };
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>BufferNext<cr>";
      options = {
        desc = "cycle to next buffer";
      };
    }
    {
      mode = "n";
      key = "<C-b>";
      action = "<cmd>BufferPrev<cr>";
      options = {
        desc = "cycle to previous buffer";
      };
    }

    # twilight
    {
      mode = "n";
      key = "<leader>tw";
      action = "<cmd>Twilight<cr>";
      options = {
        desc = "twilight toggle";
      };
    }

    # outline
    {
      mode = "n";
      key = "<leader>oo";
      action = "<cmd>Outline<cr>";
      options = {
        desc = "twilight toggle";
      };
    }

    # trouble
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "]t";
      action.__raw = ''
        function()
          require("trouble").next({skip_groups = true, jump = true})
        end
      '';
      options.desc = "next diagnostic";
    }
    {
      mode = "n";
      key = "[t";
      action.__raw = ''
        function()
          require("trouble").prev({skip_groups = true, jump = true})
        end
      '';
      options.desc = "prev diagnostic";
    }

    # Markview
    {
      mode = "n";
      key = "<leader>mt";
      action = "<cmd>Markview<cr>";
      options.desc = "Toggle Markview";
    }

    # Glow
    {
      mode = "n";
      key = "<leader>mg";
      action = "<cmd>Glow<cr>";
      options.desc = "Toggle Glow";
    }

    # others
    {
      mode = "n";
      key = "<leader>Q";
      action = "<cmd>bdelete!<cr>";
      options = {
        desc = "force delete buffer and window";
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>wa<cr>";
      options = {
        desc = "save all buffers";
      };
    }
  ];
}
