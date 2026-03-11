{inputs, ...}: {
  imports = [
    inputs.caelestia.homeManagerModules.default
    ./launcher.nix
    ./bar.nix
    ./utilities.nix
    ./general.nix
    ./daemon.nix
  ];

  programs.caelestia = {
    enable = true;

    cli = {
      enable = true;
      settings = {
        wallpaper.postHook = ''
          # bash
          mkdir -p /var/lib/sddm-wallpaper
          cp -f $WALLPAPER_PATH /var/lib/sddm-wallpaper/wallpaper
          # swww img $WALLPAPER_PATH --transition-type random --transition-duration 2
        '';
        theme = {
          enableTerm = true;
          enableHypr = true;
          enableDiscord = true;
          enableSpicetify = true;
          enableFuzzel = true;
          enableBtop = true;
          enableGtk = true;
          enableQt = true;
        };
      };
    };

    settings = {
      border.thickness = 5;
      lock.recolourLogo = true;
      paths.wallpaperDir = inputs.wallpapers;

      appearance = {
        mediaGifSpeedAdjustment = 300;
        sessionGifSpeed = 0.7;
        padding.scale = 1;
        spacing.scale = 1;
        font.size.scale = 1;
      };

      background = {
        enabled = true;
        wallpaperEnabled = true;
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
      };

      dashboard = {
        enabled = true;
        showOnHover = true;
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
          logout = ["caelestia-shell" "kill"];
          shutdown = ["systemctl" "poweroff"];
          hibernate = ["systemctl" "sleep"];
          reboot = ["systemctl" "reboot"];
        };
      };
    };
  };
}
