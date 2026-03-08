{
  home = {
    sessionPath = [
      "$HOME/.config/pulse/cookie"
      "$HOME/.config/copilot"
      "$HOME/.local/share/gnupg"
      "$HOME/.config/docker"
      "$HOME/.cache/nuget"
      "$HOME/.local/share/dotnet"
    ];
    sessionVariables = {
      __GL_SHADER_DISK_CACHE_PATH = "$HOME/.cache/nv";
      XDG_NVIDIA_SETTINGS_CONFIG = "$HOME/.config/nvidia/settings";
      DOTNET_CLI_HOME = "$HOME/.local/share/dotnet";
      NUGET_PACKAGES = "$HOME/.cache/nuget";
      DOCKER_CONFIG = "$HOME/.config/docker";
      GNUPGHOME = "$HOME/.local/share/gnupg";
      PULSE_COOKIE = "$HOME/.config/pulse/cookie";
      SQLIT_CONFIG_DIR = "$HOME/.config/sqlit";
      COPILOT_AGENT_HOME = "$HOME/.config/copilot";
      _JAVA_AWT_WM_NONEREPARENTING = "1";
      GRIMBLAST_HIDE_CURSOR = "0";
      QS_ICON_THEME = "hicolor";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      NIXPKGS_ALLOW_UNFREE = 1;

      # --- XWayland ---
      GDK_BACKEND = "wayland,x11";
      WLR_NO_HARDWARE_MODIFIERS = "1";
      MOZ_ENABLE_WAYLAND = "1";
      KITTY_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";

      # --- Theming & Scaling ---
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      QT_QPA_PLATFORM = "wayland";
      DISABLE_QT5_COMPAT = "0";
    };
  };
}
