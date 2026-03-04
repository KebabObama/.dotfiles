{
  programs.nvf.settings.vim.session.nvim-session-manager = {
    enable = true;
    setupOpts.autoload_mode = "Disabled";
    mappings = {
      deleteSession = "<leader>sd";
      loadLastSession = "<leader>sl";
      loadSession = "<leader>sp";
      saveCurrentSession = "<leader>ss";
    };
  };
}
