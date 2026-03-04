{
  pkgs,
  lib,
  ...
}: let
  vscodeTools = with pkgs; [
    nixd
    nixfmt
    tinymist
    alejandra
    python3
    nixdoc
  ];
in {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    package = pkgs.vscode.overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
      postFixup =
        (oldAttrs.postFixup or "")
        + "wrapProgram $out/bin/code --prefix PATH : ${lib.makeBinPath vscodeTools}";
    });
  };
}
