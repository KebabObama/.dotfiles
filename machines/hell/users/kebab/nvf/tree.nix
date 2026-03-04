{
  programs.nvf.settings.vim = {
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        default_source = "filesystem";
        buffers.follow_current_file.enabled = true;
        buffers.group_empty_dirs = true;
        buffers.show_unloaded = true;
      };
    };
  };
}
