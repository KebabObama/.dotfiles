{
  programs.caelestia.settings = {
    launcher = {
      showOnHover = false;
      actionPrefix = ">";
      specialPrefix = "@";
      enableDangerousActions = true;
      maxWallpapers = 7;
      hiddenApps = [
        "vim"
        "gvim"
      ];
      actions = [
        {
          name = "Clear";
          icon = "notification_important";
          description = "Clear notifications center";
          command = ["caelestia-shell" "ipc" "call" "notifs" "clear"];
        }
        {
          name = "Sidebar";
          icon = "view_sidebar";
          description = "Toggle shell sidebar";
          enabled = true;
          command = [
            "caelestia-shell"
            "ipc"
            "call"
            "drawers"
            "toggle"
            "sidebar"
          ];
        }
        {
          name = "Calculator";
          icon = "calculate";
          description = "Do simple math equations";
          command = [
            "autocomplete"
            "calc"
          ];
          enabled = true;
        }
        {
          name = "Scheme";
          icon = "palette";
          description = "Change the current color scheme";
          command = [
            "autocomplete"
            "scheme"
          ];
          enabled = true;
        }
        {
          name = "Wallpaper";
          icon = "image";
          description = "Change the current wallpaper";
          command = [
            "autocomplete"
            "wallpaper"
          ];
          enabled = true;
        }
        {
          name = "Variant";
          icon = "colors";
          description = "Change the current scheme variant";
          command = [
            "autocomplete"
            "variant"
          ];
          enabled = true;
        }
        {
          name = "toggle Game mode";
          icon = "gamepad";
          description = "Toggles game mode";
          enabled = true;
          command = [
            "caelestia-shell"
            "ipc"
            "call"
            "gameMode"
            "toggle"
          ];
        }
        {
          name = "Transparency";
          icon = "opacity";
          description = "Change shell transparency";
          command = [
            "autocomplete"
            "transparency"
          ];
          enabled = true;
        }
        {
          name = "Random";
          icon = "casino";
          description = "Switch to a random wallpaper";
          command = [
            "caelestia"
            "wallpaper"
            "-r"
          ];
          enabled = true;
        }
        {
          name = "Light";
          icon = "light_mode";
          description = "Change the scheme to light mode";
          command = [
            "setMode"
            "light"
          ];
          enabled = true;
        }
        {
          name = "Dark";
          icon = "dark_mode";
          description = "Change the scheme to dark mode";
          command = [
            "setMode"
            "dark"
          ];
          enabled = true;
        }
        {
          name = "Shutdown";
          icon = "power_settings_new";
          description = "Shutdown the system";
          command = [
            "systemctl"
            "poweroff"
          ];
          enabled = true;
        }
        {
          name = "Keep awake";
          icon = "mode_standby";
          description = "Toggle idle inhabitor";
          enabled = true;
          command = [
            "caelestia-shell"
            "ipc"
            "call"
            "idleInhibitor"
            "toggle"
          ];
        }
        {
          name = "Reboot";
          icon = "cached";
          description = "Reboot the system";
          command = [
            "systemctl"
            "reboot"
          ];
          enabled = true;
        }
        {
          name = "Logout";
          icon = "exit_to_app";
          description = "Log out of the current session";
          command = [
            "loginctl"
            "terminate-user"
            ""
          ];
          enabled = true;
        }
        {
          name = "Lock";
          icon = "lock";
          description = "Lock the current session";
          command = [
            "loginctl"
            "lock-session"
          ];
          enabled = true;
        }
        {
          name = "Settings";
          icon = "settings";
          description = "Configure the shell";
          enabled = true;
          command = [
            "caelestia-shell"
            "ipc"
            "call"
            "controlCenter"
            "open"
          ];
        }
        {
          name = "Sleep";
          icon = "bedtime";
          description = "Suspend then hibernate";
          command = [
            "systemctl"
            "suspend-then-hibernate"
          ];
          enabled = true;
        }
      ];
    };
  };
}
