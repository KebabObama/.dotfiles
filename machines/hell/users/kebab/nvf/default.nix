{
  inputs,
  lib,
  ...
}: {
  imports =
    [inputs.nvf.homeManagerModules.default]
    ++ (
      builtins.filter
      (path: lib.hasSuffix ".nix" (toString path) && (toString path) != (toString ./default.nix))
      (lib.filesystem.listFilesRecursive ./.)
    );

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    viAlias = true;
    vimAlias = true;
    lazy.enable = true;
    git.enable = false;
    globals.mapleader = " ";
    globals.maplocalleader = " ";
    assistant.copilot.cmp.enable = true;
    assistant.copilot.enable = true;

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };

    options = {
      showbreak = "󱞪 ";
      whichwrap = "b,s,h,l,<,>,[,]";
      virtualedit = "onemore";
      signcolumn = "no";
      shiftwidth = 2;
      autoindent = true;
      wrap = true;
      cmdheight = 0;
      tabstop = 2;
      smartindent = true;
      undofile = true;
      mouse = "a";
      number = true;
      relativenumber = false;
    };
  };
}
