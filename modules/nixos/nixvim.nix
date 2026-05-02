{ pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      updatetime = 50;
      clipboard = "unnamedplus";
    };

    plugins = {
      # UI / Aesthetics
      web-devicons.enable = true;
      lualine.enable = true;
      bufferline.enable = true;
      noice.enable = true;
      notify.enable = true;
      dressing.enable = true;
      indent-blankline.enable = true;
      todo-comments.enable = true;
      fidget.enable = true;
      
      # Dashboard
      alpha = {
        enable = true;
        theme = "dashboard";
      };

      # File Explorer
      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
          window.position = "left";
        };
      };

      # Keybinding helper
      which-key = {
        enable = true;
      };

      # Terminal
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          open_mapping = "[[<c-\>]]";
        };
      };

      # Commenting
      comment.enable = true;

      # Fuzzy Finder
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = { action = "find_files"; options.desc = "Find files"; };
          "<leader>fg" = { action = "live_grep"; options.desc = "Live grep"; };
          "<leader>fb" = { action = "buffers"; options.desc = "Find buffers"; };
          "<leader>fh" = { action = "help_tags"; options.desc = "Help tags"; };
        };
      };

      # Syntax highlighting
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      # LSP
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          pyright.enable = true;
          gopls.enable = true;
          ts_ls.enable = true;
          bashls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
        keymaps.lspBuf = {
          gd = "definition";
          gD = "references";
          gt = "type_definition";
          gi = "implementation";
          K = "hover";
          "<leader>la" = "code_action";
          "<leader>lr" = "rename";
          "<leader>lf" = "format";
        };
      };

      # Formatters
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
        };
      };

      # Completion
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;

      # Git
      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };
      
      # Editing tools
      nvim-autopairs.enable = true;
      ts-autotag.enable = true;
    };

    keymaps = [
      # Neotree
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "Toggle Neotree";
      }
      
      # Buffer navigation
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<cr>";
        options.desc = "Prev Buffer";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<cr>";
        options.desc = "Next Buffer";
      }
      {
        mode = "n";
        key = "<leader>c";
        action = "<cmd>bdelete<cr>";
        options.desc = "Close Buffer";
      }

      # Split navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Move to left split";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Move to below split";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Move to above split";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Move to right split";
      }
      
      # Clear search highlights
      {
        mode = "n";
        key = "<leader>h";
        action = "<cmd>nohlsearch<cr>";
        options.desc = "Clear Search Highlights";
      }
    ];

    # Which-key categories
    extraConfigLua = ''
      require("which-key").add({
        { "<leader>f", group = "Find" },
        { "<leader>l", group = "LSP" },
        { "<leader>t", group = "Terminal" },
      })
    '';
  };
}
