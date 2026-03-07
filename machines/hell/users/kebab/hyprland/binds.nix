{...}: {
  wayland.windowManager.hyprland.settings = {
    binds = {
      movefocus_cycles_fullscreen = true;
      allow_workspace_cycles = true;
    };

    bindl = [
      ", XF86AudioPlay        , exec , caelestia-shell ipc call mpris playPause"
      ", XF86AudioNext        , exec , caelestia-shell ipc call mpris next"
      ", XF86AudioPrev        , exec , caelestia-shell ipc call mpris previous"
      ", XF86AudioStop        , exec , caelestia-shell ipc call mpris stop"
      ", XF86AudioMute        , exec , wpctl set-mute @DEFAULT_AUDIO_SINK@   toggle"
      ", XF86AudioMicMute     , exec , wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      ", XF86MonBrightnessDown, exec , caelestia-shell ipc call brightness set 5%-    "
      ", XF86MonBrightnessUp  , exec , caelestia-shell ipc call brightness set +5%    "
      ", XF86AudioRaiseVolume , exec , wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 3%+ "
      ", XF86AudioLowerVolume , exec , wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 3%- "
    ];

    bind =
      [
        "Super        , F1 , togglespecialworkspace, special"
        "Super        , F2 , togglespecialworkspace, communication"
        "Super        , F3 , togglespecialworkspace, music"

        "Super Shift  , F1 , togglespecialworkspace, special"
        "Super Shift  , F2 , togglespecialworkspace, communication"
        "Super Shift  , F3 , togglespecialworkspace, music"

        "Super        , W		         , killactive , "
        "Super Shift  , W		         , killactive , "

        "Super	      , Space        , layoutmsg  , swapwithmaster master"
        "Super        , D            , exec       , toggle-minimize "
        "Super        , X            , exec       , toggle-float "
        "Super        , V            , exec       , caelestia clipboard "
        "Super        , Print        , exec       , caelestia screenshot --region --freeze"
        "             , Print        , exec       , caelestia-shell ipc call picker openFreezeClip  "
        "Alt          , F4           , exec       , caelestia-shell ipc call drawers toggle session "
        "Super        , L            , exec       , caelestia-shell ipc call lock lock"
        "Super Shift  , L            , exec       , caelestia-shell ipc call lock lock"

        "Super Control, Right        , workspace  , r+1   "
        "Super Control, Left         , workspace  , r-1   "

        "Super	      , F		         , exec       , toggle-fullscreen "
        "Super Shift  , F	           , exec       , toggle-fullscreen "

        "Super	      , Semicolon    , exec 	    , kitty "
        "Super        , Return       , exec 	    , kitty "
        "Super Shift  , Semicolon    , exec 	    , kitty "
        "Super Shift  , Return       , exec 	    , kitty "
      ]
      ++ (builtins.concatLists (builtins.genList (i: [
          "Super, code:1${toString i}, workspace, ${toString (i + 1)}"
          "Super Shift, code:1${toString i}, movetoworkspace, ${toString (i + 1)}"
        ])
        9));
    bindr = ["Super,Super_L,exec,caelestia-shell ipc call drawers toggle launcher"];
    bindm = ["Super, mouse:272, movewindow" "Super, mouse:273, resizewindow"];
  };
}
