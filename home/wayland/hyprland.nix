{ osConfig
, config
, inputs
, pkgs
, lib
, ...
}:
let
  laptop = osConfig.networking.hostName == "cmargiotta";
  desktop = osConfig.networking.hostName == "nixos-desktop";

  commands = import ./commands.nix;
in
{
  home.packages = with pkgs;
    [
      grimblast
      hyprcursor
      hyprpaper
      slurp
      hyprcursor
    ];

  services.hyprpaper = {
    settings = {
      splash = false;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = osConfig.programs.hyprland.package;

    systemd = {
      enable = false;
      enableXdgAutostart = false;
    };

    plugins = with inputs; [
      hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
      hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
    ];

    settings = {
      general = {
        gaps_in = 2;
        gaps_out = 8;
        border_size = 2;
        layout = "master";
        resize_on_border = false;
      };

      misc = {
        vrr = 1;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        swallow_regex = ".*kitty.*";
      };

      binds = {
        workspace_back_and_forth = true;
        workspace_center_on = 1;
      };

      animations = {
        enabled = 1;
        animation = [
          "windows, 1, 7, default"
          "border, 1, 10, default"
          "fade, 1, 10, default"
          "workspaces, 1, 6, default"
        ];
      };

      decoration = {
        rounding = 4;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        dim_inactive = true;
        dim_strength = 0.05;
      };

      render = {
        explicit_sync = 0;
        direct_scanout = true;
      };

      input = lib.mkMerge [
        {
          kb_layout = "us";
          kb_variant = "intl";
          mouse_refocus = false;
        }

        (lib.mkIf (laptop) {
          # Laptop touchpad
          touchpad = {
            disable_while_typing = true;
            natural_scroll = false;
            tap-to-click = true;
          };
        })
      ];

      gestures = (
        lib.mkIf (laptop) {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
        }
      );

      master = {
        new_on_top = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      exec-once = lib.mkMerge [
        [
          "uwsm app -- hyprpaper"
          "uwsm app -- hyprpanel"
          "uwsm app -- blueman-applet"
          "uwsm app -- element-desktop"
          "uwsm app -- thunderbird"
          "uwsm app -- telegram-desktop"
        ]
        (lib.mkIf desktop [
          "uwsm app -- kitty --class=btop btop"
          # "uwsm app -- kitty --class=cava cava"
        ])
      ];

      exec = lib.mkMerge [
        [
          "sleep 5 && ${toString ./scripts/random_wallpaper.sh}"
        ]
        (lib.mkIf desktop [
          # Select primary screen
          "sleep 3.5 && xrandr --output DP-2 --primary -s 3440x1440 && xrandr --output DP-4 --primary -s 3440x1440"
        ])
      ];

      "$MOD" = "SUPER";
      "$MODSHIFT" = "SUPERSHIFT";

      bindm = [
        # Move floating window
        "$MOD, mouse:272, movewindow"
      ];

      bind = [
        # Exec bindings
        "$MOD, Return, exec, uwsm app -- ghostty"
        "$MOD, D,      exec, ~/.config/rofi/launchers/type-6/launcher.sh"
        "$MOD, L,      exec, uwsm app -- hyprlock"
        "    ,Print,   exec, grimblast copy output"
        "$MOD, S,      exec, grimblast copy area"
        "$MODSHIFT, S, exec, ${commands.screenshot}"
        "$MODSHIFT, W, exec, grimblast copy window"
        "$MOD, T,      exec, scratchpad"
        "$MODSHIFT, T, exec, scratchpad -g"
        "$MODSHIFT, R, exec, hyprctl reload"

        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute,        exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

        ", XF86MonBrightnessUp,   exec, sh -c \"sudo brightnessctl s 5%+\""
        ", XF86MonBrightnessDown, exec, sh -c \"sudo brightnessctl s 5%-\""

        # Window bindings
        "$MOD,      Q, killactive"
        "$MOD,      F, fullscreen"
        "$MODSHIFT, F, togglefloating"
        "$MOD,      M, layoutmsg, swapwithmaster"

        # Navigation bindings
        "$MOD, left,  movefocus, l"
        "$MOD, right, movefocus, r"
        "$MOD, up,    movefocus, u"
        "$MOD, down,  movefocus, d"

        "$MODSHIFT, left,  movewindow, l"
        "$MODSHIFT, right, movewindow, r"
        "$MODSHIFT, up,    movewindow, u"
        "$MODSHIFT, down,  movewindow, d"

        # Plugins
        "$MOD, I, exec, hyprctl dispatch hyprexpo:expo toggle"

        # Orientation
        "$MODSHIFT, V, layoutmsg, orientationtop"
        "$MODSHIFT, H, layoutmsg, orientationleft"
      ] ++ (
        # Build workspace commands
        builtins.concatLists (builtins.genList
          (i:
            [
              "$MOD, ${toString i}, workspace, ${toString i}"
              "$MODSHIFT, ${toString i}, movetoworkspace, ${toString i}"
            ]
          )
          10)
      );

      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method = "center current";

          enable_gesture = true;
          gesture_fingers = 3;
          gesture_distance = 300;
          gesture_positive = true; # positive = swipe down. Negative = swipe up.
        };

        dynamic-cursors = {
          enabled = true;
          mode = "tilt";
          threshold = 2;

          tilt = {
            limit = 5000;
            function = "negative_quadratic";
          };


          # configure shake to find
          # magnifies the cursor if its is being shaken
          shake = {
            enabled = true;
            nearest = true;
            threshold = 6.0;
            base = 4.0;
            speed = 4.0;
            influence = 0.0;
            limit = 0.0;
            timeout = 2000;
            effects = false;
            ipc = false;
          };

          hyprcursor = {
            nearest = 0;
            enabled = true;
            resolution = -1;
            fallback = "clientside";
          };
        };
      };

      windowrule = [
        "float,       pwvucontrol"
        "center,      pwvucontrol"
        "float,       ^(blueman-manager)$"
        "float,       org.gnome.Calculator"
        "noblur,      ^(steam)$"
        "forcergbx,   ^(steam)$"
        "workspace 9, ^(steam_app.*)$"
        "float,       title:Picture-in-Picture"

        "workspace 11, org.telegram.desktop"
        "workspace 12, ^(steam)$"
        "workspace 13, Sonixd"
        "workspace 14, thunderbird"
        "workspace 15, Element"
      ];
    };

    extraConfig = lib.mkMerge
      [
        ''
          # Resize mode
          bind = $MOD, R, submap, resize

          submap = resize
          binde  = ,right,  resizeactive,  10  0
          binde  = ,left,   resizeactive, -10  0
          binde  = ,up,     resizeactive,  0  -10
          binde  = ,down,   resizeactive,  0   10
          bind   = ,escape, submap, reset
          submap = reset

          workspace = w[tv1], gapsout:0, gapsin:0
          workspace = f[1], gapsout:0, gapsin:0

          windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
          windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
          windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
          windowrulev2 = rounding 0, floating:0, onworkspace:f[1]
        ''
        (lib.mkIf laptop ''
          $EXTERNAL = desc:HP Inc. HP 27mq CNC34518VJ
          $INTERNAL = eDP-1

          workspace = 11, monitor:$EXTERNAL
          workspace = 12, monitor:$EXTERNAL
          workspace = 13, monitor:$EXTERNAL
          workspace = 14, monitor:$EXTERNAL
          workspace = 15 monitor:$EXTERNAL,

          monitor=HDMI-A-1,2560x1440,1700x0,1
          monitor=eDP-1,1920x1080,0x1440,1
          monitor=,preferred,auto,1
        '')

        (lib.mkIf desktop ''
          $ULTRAWIDE = desc:Samsung Electric Company C34H89x H4ZN200636
          $VERTICAL  = desc:Microstep MSI MP242 PA1T010907358
          $UPPER     = desc:Microstep MSI MP273 PB4H793100073

          monitor    = $ULTRAWIDE, highres, 1080x1080, 1
          monitor    = $UPPER,     highres, 1550x0,    1
          monitor    = $VERTICAL,  highres, 0x500,     1
          monitor    = $VERTICAL,  transform, 1

          workspace  = 1,      monitor:$ULTRAWIDE, default:true
          workspace  = 9,      monitor:$ULTRAWIDE
          workspace  = name:s, monitor:$VERTICAL,  default:true, layoutopt:orientation:top, gapsin:0, gapsout:0, border:false, decorate:false
          workspace  = 11, monitor:$UPPER
          workspace  = 12, monitor:$UPPER
          workspace  = 13, monitor:$UPPER
          workspace  = 14, monitor:$UPPER
          workspace  = 15, monitor:$UPPER

          windowrule = workspace name:s, ^(cava)$
          windowrule = workspace name:s, ^(btop)$
        '')
      ];
  };
}
