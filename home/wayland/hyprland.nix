{ pkgs
, osConfig
, lib
, ...
}:
let
  laptop = osConfig.networking.hostName == "cmargiotta";
  desktop = osConfig.networking.hostName == "nixos-desktop";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = osConfig.programs.hyprland.package;

    systemd = {
      enable = true;
      enableXdgAutostart = false;
    };

    settings = {
      general = {
        gaps_in = 2;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "0x66ee1111";
        "col.inactive_border" = "0x66333333";
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
        no_gaps_when_only = true;
        new_on_top = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      exec-once = lib.mkMerge [
        [
          "swaync"
          "blueman-applet"
          "element-desktop"
          "thunderbird"
          "telegram-desktop"
        ]
        (lib.mkIf desktop [
          "kitty --class=btop btop"
          "~/.config/hypr/scripts/vertical-layout.sh"
        ])
      ];

      exec = lib.mkMerge [
        [
          "~/.scripts/random_wallpaper.sh"
        ]
        (lib.mkIf desktop [
          # Select primary screen
          "sleep 3.5 && xrandr --output DP-2 --primary -s 3440x1440 && xrandr --output DP-4 --primary -s 3440x1440"

          # Autoconnect bluetooth soundbar
          "sleep 5 && echo \"connect 00:15:83:02:82:79\" | bluetoothctl\""
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
        "$MOD, Return, exec, kitty"
        "$MOD, D,      exec, ~/.config/rofi/launchers/type-6/launcher.sh"
        "$MOD, L,      exec, hyprlock"
        "    ,Print,   exec, grimblast copy output"
        "$MOD, S,      exec, grimblast copy area"
        "$MODSHIFT, S, exec, GRIMBLAST_EDITOR=\"swappy -f\" grimblast edit area"
        "$MODSHIFT, W, exec, grimblast copy window"
        "$MODSHIFT, B, exec, ~/.scripts/random_wallpaper.sh"
        "$MOD, T,      exec, scratchpad"
        "$MODSHIFT, T, exec, scratchpad -g"
        "$MODSHIFT, R, exec, hyprctl reload"

        ", XF86AudioRaiseVolume, exec, ~/.config/hypr/scripts/volume_brightness.sh volume_up"
        ", XF86AudioLowerVolume, exec, ~/.config/hypr/scripts/volume_brightness.sh volume_down"
        ", XF86AudioMute,        exec, ~/.config/hypr/scripts/volume_brightness.sh volume_mute"
        ", XF86AudioMicMute,     exec, ~/.config/hypr/scripts/volume_brightness.sh volume_mute"

        ", XF86MonBrightnessUp,   exec, ~/.config/hypr/scripts/volume_brightness.sh brightness_up"
        ", XF86MonBrightnessDown, exec, ~/.config/hypr/scripts/volume_brightness.sh brightness_down"

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

        "$MOD, 1, workspace, 1"
        "$MOD, 2, workspace, 2"
        "$MOD, 3, workspace, 3"
        "$MOD, 4, workspace, 4"
        "$MOD, 5, workspace, 5"
        "$MOD, 6, workspace, 6"
        "$MOD, 7, workspace, 7"
        "$MOD, 8, workspace, 8"
        "$MOD, 9, workspace, 9"
        "$MOD, 0, workspace, 10"

        "$MODSHIFT, 1, movetoworkspace, 1"
        "$MODSHIFT, 2, movetoworkspace, 2"
        "$MODSHIFT, 3, movetoworkspace, 3"
        "$MODSHIFT, 4, movetoworkspace, 4"
        "$MODSHIFT, 5, movetoworkspace, 5"
        "$MODSHIFT, 6, movetoworkspace, 6"
        "$MODSHIFT, 7, movetoworkspace, 7"
        "$MODSHIFT, 8, movetoworkspace, 8"
        "$MODSHIFT, 9, movetoworkspace, 9"
        "$MODSHIFT, 0, movetoworkspace, 10"

        # Orientation
        "$MODSHIFT, V, layoutmsg, orientationtop"
        "$MODSHIFT, H, layoutmsg, orientationleft"
      ];

      windowrule = [
        "float,       pavucontrol"
        "center,      pavucontrol"
        "noblur,      ^(steam)$"
        "forcergbx,   ^(steam)$"
        "workspace 9, ^(steam_app.*)$"
        "float,       title:Picture-in-Picture"

        "workspace name:, org.telegram.desktop"
        "workspace name:, ^(steam)$"
        "workspace name:, Sonixd"
        "workspace name:, thunderbird"
        "workspace name:󰍩, Element"
      ];

      env = lib.mkMerge [
        [
          "CLUTTER_BACKEND,wayland"
          "DBUS_SESSION_BUS_ADDRESS,unix:path=/run/user/1000/bus"
          "ELECTRON_OZONE_PLATFORM_HINT,auto"
          "GDK_BACKEND,wayland,x11,*"
          "HYPRCURSOR_SIZE,24"
          "HYPRCURSOR_THEME,\"Nordzy-cursors-white\""
          "MOZ_DISABLE_RDD_SANDBOX,1"
          "MOZ_ENABLE_WAYLAND, 1"
          "NIXOS_OZONE_WL, 1"
          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
          "QT_QPA_PLATFORM, wayland;xcb"
          "QT_QPA_PLATFORMTHEME, qt5ct"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
          "SDL_VIDEODRIVER,wayland"
          "WLR_DRM_NO_ATOMIC,1"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE, wayland"
          "_JAVA_AWT_WM_NONREPARENTING"
          "_JAVA_AWT_WM_NONREPARENTING=1"
        ]
        (lib.mkIf desktop [
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "LIBVA_DRIVER_NAME,nvidia"
          "NVD_BACKEND,direct"
          "PROTON_ENABLE_NGX_UPDATER,1"
          "WLR_USE_LIBINPUT,0"
          "__GL_GSYNC_ALLOWED,1"
          "__GL_MaxFramesAllowed,1"
          "__GL_VRR_ALLOWED,1"
        ])
      ];

    };

    extraConfig = lib.mkMerge [
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
      ''
      (lib.mkIf laptop ''
        $EXTERNAL = desc:HP Inc. HP 27mq CNC34518VJ
        $INTERNAL = eDP-1

        workspace = name:, monitor:$EXTERNAL
        workspace = name:, monitor:$EXTERNAL
        workspace = name:, monitor:$EXTERNAL
        workspace = name:, monitor:$EXTERNAL
        workspace = name:󰍩 monitor:$EXTERNAL,

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
        workspace  = 2,      monitor:$VERTICAL,  default:true, layoutopt:orientation:top
        workspace  = name:, monitor:$UPPER
        workspace  = name:󰍩  monitor:$UPPER
        workspace  = name:, monitor:$UPPER
        workspace  = name:, monitor:$UPPER
        workspace  = name:  monitor:$UPPER

        windowrule = workspace 3, Discord
        windowrule = workspace 2, com.github.wwmm.easyeffects
        windowrule = workspace 2, ^(btop)$
      '')
    ];
  };
}
