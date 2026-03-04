{
  programs.caelestia.settings.bar = {
    tray = {
      background = false;
      compact = false;
      recolour = true;
    };

    persistent = true;
    clock.showIcon = false;
    entries = [
      {
        id = "logo";
        enabled = true;
      }
      {
        id = "workspaces";
        enabled = true;
      }
      {
        id = "spacer";
        enabled = true;
      }
      {
        id = "activeWindow";
        enabled = true;
      }
      {
        id = "spacer";
        enabled = true;
      }
      {
        enabled = true;
        id = "tray";
      }
      {
        id = "clock";
        enabled = true;
      }
      {
        id = "statusIcons";
        enabled = true;
      }
      {
        id = "power";
        enabled = true;
      }
    ];

    status = {
      showBattery = true;
      showWifi = true;
      showKbLayout = false;
      showAudio = true;
      showLockStatus = false;
    };

    scrollActions = {
      brightness = false;
      volume = false;
      workspaces = false;
    };

    workspaces = {
      activeIndicator = true;
      perMonitorWorkspaces = false;
      showWindows = false;
      occupiedBg = false;
      activeTrail = false;
      label = "  ";
      specialWorkspaceIcons = [
        {
          name = "discord";
          icon = "forum";
        }
        {
          name = "desktop";
          icon = "circle";
        }
      ];
    };
  };
}
