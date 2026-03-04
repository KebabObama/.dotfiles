{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    rnnoise-plugin
    blender
    krita
    android-studio
    upscayl
    sqlit-tui
  ];
}
