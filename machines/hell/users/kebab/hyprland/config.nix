{
  wayland.windowManager.hyprland.settings = {
    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
      enforce_permissions = false;
    };

    general = {
      layout = "master";
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      resize_on_border = true;
      "col.active_border" = "0xff666666";
      gesture = [
        "3, horizontal, workspace"
        "3, down      , dispatcher, exec, toggle-float"
        "3, up        , fullscreen"
      ];
    };

    misc = {
      disable_autoreload = false;
      disable_hyprland_logo = true;
      always_follow_on_dnd = true;
      layers_hog_keyboard_focus = true;
      animate_manual_resizes = true;
      enable_swallow = false;
      focus_on_activate = true;
      middle_click_paste = false;
      vrr = 0;
      vfr = true;
    };

    dwindle = {
      force_split = 2;
      special_scale_factor = 1.0;
      split_width_multiplier = 1.0;
      use_active_for_splits = true;
      pseudotile = "yes";
      smart_split = false;
      preserve_split = true;
    };

    master = {
      mfact = 0.7;
      new_status = "slave";
    };

    decoration = {
      rounding = 18;
      active_opacity = 1.0;
      inactive_opacity = 0.95;
      dim_inactive = true;
      dim_strength = 0.2;
      shadow.enabled = false;
      blur = {
        enabled = true;
        size = 3;
        passes = 2;
        brightness = 1;
        contrast = 1.4;
        ignore_opacity = false;
        noise = 0;
        new_optimizations = true;
        xray = true;
        popups = false;
      };
    };
  };
}
