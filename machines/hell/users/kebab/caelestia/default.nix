{inputs, ...}: {
  imports = [
    inputs.caelestia.homeManagerModules.default
    ./cli.nix
    ./launcher.nix
    ./bar.nix
    ./utilities.nix
    ./general.nix
    ./daemon.nix
  ];

  programs.caelestia = {
    enable = true;
    settings = {
      border.thickness = 5;

      appearance = {
        mediaGifSpeedAdjustment = 300;
        sessionGifSpeed = 0.7;
        padding.scale = 1;
        spacing.scale = 1;
        font.size.scale = 1;
      };

      background = {
        enabled = true;
        desktopClock = {
          enabled = true;
          position = "bottom-right";
          invertColors = false;
          background = {
            enabled = false;
            opacity = 0.7;
            blur = false;
          };
        };
        visualizer = {
          autoHide = false;
          enabled = false;
          blur = false;
          spacing = 1;
          rounding = 1;
        };
      };

      lock.recolourLogo = true;
      paths = {
        wallpaperDir = "~/.dotfiles/wallpapers";
        mediaGif = null;
      };

      dashboard = {
        enabled = true;
        showOnHover = false;
        dragThreshold = 30;
        updateInterval = 1000;
        mediaUpdateInterval = 1000;
        performance = {
          showBattery = true;
          showGpu = true;
          showCpu = true;
          showMemory = true;
          showStorage = true;
          showNetwork = true;
        };
      };

      sidebar = {
        enabled = true;
        dragThreshold = 30;
      };

      notifs = {
        openExpanded = true;
        expandThreshold = 20;
        maxToasts = 5;
      };

      osd = {
        enabled = true;
        enableBrightness = true;
        enableMicrophone = true;
        hideDelay = 2000;
      };

      services = {
        gpuType = "nvidia";
        weatherLocation = "Prague";
        maxVolume = 2;
        smartScheme = true;
        visualiserBars = 24;
        useFahrenheit = false;
        useFahrenheitPerformance = false;
        useTwelveHourClock = false;
      };

      session = {
        enabled = true;
        dragThreshold = 30;
        commands = {
          logout = [
            "caelestia-shell"
            "kill"
          ];
          shutdown = [
            "systemctl"
            "poweroff"
          ];
          hibernate = [
            "systemctl"
            "hibernate"
          ];
          reboot = [
            "systemctl"
            "reboot"
          ];
        };
      };
    };
  };
}
