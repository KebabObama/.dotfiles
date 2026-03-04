{
  programs.nvf.settings.vim = {
    notify.nvim-notify = {
      enable = true;
      setupOpts.background_colour = "#000000";
    };

    dashboard.alpha = {
      enable = true;
      theme = "dashboard";
    };

    ui = {
      fastaction.enable = false;
      borders.enable = true;
      borders.globalStyle = "rounded";
      noice.enable = true;
      noice.setupOpts = {
        cmdline.enabled = true;
        messages.enabled = true;
        lsp.hover.enabled = true;
      };
    };
  };
}
