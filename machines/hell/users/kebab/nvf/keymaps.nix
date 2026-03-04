{
  programs.nvf.settings.vim.keymaps = [
    {
      key = "j";
      mode = ["n" "v"];
      action = "gj";
    }
    {
      key = "k";
      mode = ["n" "v"];
      action = "gk";
    }
    {
      key = "<Down>";
      mode = "i";
      action = "<C-o>gj";
    }
    {
      key = "<Up>";
      mode = "i";
      action = "<C-o>gk";
    }

    {
      key = "<Down>";
      mode = ["n" "v"];
      action = "gj";
    }
    {
      key = "<Up>";
      mode = ["n" "v"];
      action = "gk";
    }

    {
      key = "<A-Down>";
      mode = "n";
      action = ":m .+1<CR>== ";
      desc = "Move line down";
    }
    {
      key = "<A-Up>";
      mode = "n";
      action = ":m .-2<CR>== ";
      desc = "Move line up";
    }
    {
      key = "<A-Down>";
      mode = "v";
      action = ":m '>+1<CR>gv=gv";
      desc = "Move selection down";
    }
    {
      key = "<A-Up>";
      mode = "v";
      action = ":m '<-2<CR>gv=gv";
      desc = "Move selection up";
    }
    {
      key = "<leader>t";
      mode = "n";
      action = ":Lspsaga term_toggle <CR>";
      desc = "Open terminal";
    }
    {
      key = "<leader>fr";
      mode = "n";
      action = ":Telescope oldfiles<CR>";
      desc = "Recent files (Telescope)";
    }
    {
      key = "<C-a>";
      mode = "n";
      action = "ggVG";
      desc = "Select all";
    }
    {
      key = "<C-v>";
      mode = "i";
      action = "<C-r>+";
      desc = "Paste from system clipboard";
    }
    {
      key = "<leader>ee";
      mode = "n";
      action = ":Neotree focus right<CR>";
      desc = "Focus Neo-tree sidebar";
    }
    {
      key = "<leader>et";
      mode = "n";
      action = ":Neotree toggle right<CR>";
      desc = "Toggle Neo-tree sidebar";
    }
    {
      key = "<leader>eg";
      mode = "n";
      action = ":Neotree git_status toggle right<CR>";
      desc = "Toggle Git Status Sidebar";
    }
    {
      key = "<leader>eb";
      mode = "n";
      action = ":Neotree buffers toggle right<CR>";
      desc = "Toggle Buffers Sidebar";
    }
    {
      key = "<leader>ed";
      mode = "n";
      action = ":Neotree close<CR>";
      desc = "Close Sidebar";
    }

    {
      key = "<leader>bn";
      mode = "n";
      action = ":bnext<CR>";
      desc = "Next buffer";
    }
    {
      key = "<leader>bp";
      mode = ["n" "v"];
      action = ":bprev<CR>";
      desc = "Previous buffer";
    }
    {
      key = "<leader>bb";
      mode = "n";
      action = ":lua close_buffer_keep_window()<CR>";
      desc = "Close current buffer (Keep layout)";
    }
  ];
}
