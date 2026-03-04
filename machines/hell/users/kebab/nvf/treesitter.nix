{pkgs, ...}: {
  programs.nvf.settings.vim.treesitter = {
    enable = true;
    fold = true;
    autotagHtml = true;
    grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    addDefaultGrammars = true;
    context.enable = false;
    highlight.enable = true;
    indent.enable = true;
  };
}
