{
  programs.nvf.settings.vim = {
    utility = {
      oil-nvim.enable = true;
      oil-nvim.gitStatus.enable = true;
      preview.glow.enable = false;
      preview.glow.mappings.openPreview = "<leader>lp";
      images.image-nvim.enable = true;
      images.image-nvim.setupOpts.backend = "kitty";
    };

    visuals = {
      indent-blankline.enable = true;
      indent-blankline.setupOpts.scope.enabled = false;
      nvim-web-devicons.enable = true;
    };

    mini = {
      files.enable = true;
      cursorword.enable = true;
      indentscope.enable = true;
      pairs.enable = true;
    };
  };
}
