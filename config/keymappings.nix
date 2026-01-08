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
    {
      mode = "n";
      key = "gK";
      action.__raw = ''
        function()
           local new_config = not vim.diagnostic.config().virtual_lines
           vim.diagnostic.config({ virtual_lines = new_config })
         end
      '';
      options.desc = "Toggle diagnostic virtual_lines";
    }
  ];
}
