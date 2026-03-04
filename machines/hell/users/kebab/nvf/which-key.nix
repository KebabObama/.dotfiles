{
  programs.nvf.settings.vim.binds.whichKey = {
    enable = true;
    register = {
      "<leader>t" = "  +Terminal";
      "<leader>b" = "󰓩  +Buffers";
      "<leader>l" = "󰒋  +LSP";
      "<leader>s" = "󱂬  +Sessions";
      "<leader>e" = "󰙅  +Explorer";
      "<leader>f" = "󰭎  +Telescope";
      "<leader>x" = "󱖫  +Trouble";
    };
    setupOpts = {
      icons = {
        rules = false;
        icon = "";
        group = "";
      };
      preset = "modern";
      win = {
        width = 40;
        col = 9999;
      };
      layout = {
        align = "left";
        spacing = 3;
        columns = 1;
      };
    };
  };
}
