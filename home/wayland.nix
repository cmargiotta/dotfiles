{ config, pkgs, nixpkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    arandr
    grimblast
    hyprland-protocols
    libnotify
    libGL
    glmark2
    hyprpaper
    eww
    jq
    font-awesome
    nwg-look
    pamixer
    rofi-wayland
    slurp
    scratchpad
    swappy
    pulseaudio
    waypipe
    wev
    wl-clipboard
    wlr-randr
    xorg.xhost
  ];

  home.file.wofi = {
    source = ./config/rofi;
    target = ".config/rofi";
    recursive = true;
  };

  home.file.lock = {
    source = ./config/lock.sh;
    target = ".config/swaylock.sh";
    executable = true;
  };

  home.file.hyprland_scripts = {
    source = ./config/Hyprland/scripts;
    target = ".config/hypr/scripts";
  };

  home.file.eww_config = {
    source = ./config/eww;
    target = ".config/eww";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        # Display
        follow = "mouse";
        width = 300;
        origin = "bottom-right";
        offset = "24x24";
        progress_bar = true;
        progress_bar_height = 14;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        indicate_hidden = "yes";
        shrink = "no";
        transparency = 1;
        separator_height = 6;
        separator_color = "#272f57";
        eparator_color = "#272f57";
        padding = 16;
        horizontal_padding = 16;
        frame_width = 0;
        sort = "no";
        idle_threshold = 10;

        # Text
        font = "Hack Nerd Font 11";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 120;
        word_wrap = "yes";
        ignore_newline = "no";
        stack_duplicates = false;
        show_indicators = "yes";
        icon_position = "left";

        # History
        sticky_history = "yes";
        history_length = 100;

        # Misc
        browser = "firefox -new-tab";
        always_run_script = false;
        dmenu = "rofi -dmenu -p dunst:";
        class = "Dunst";
        corner_radius = 0;
        ignore_dbusclose = false;

        # Mouse
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "context, close_current";
        mouse_right_click = "close_current";
      };

      experimental = {
        per_monitor_dpi = true;
      };

      urgency_low = {
        background = "#141929fe";
        highlight = "#6fa6e7";
        frame_color = "#272f57";
        foreground = "#dae1f2";
        timeout = 8;
      };

      urgency_normal = {
        background = "#141929fe";
        highlight = "#5ca1ff";
        frame_color = "#272f57";
        foreground = "#dae1f2";
        timeout = 8;
      };

      urgency_critical = {
        background = "#5ca1ffff";
        highlight = "#fe6c5a";
        foreground = "#1c2138";
        frame_color = "#52426e";
        timeout = 0;
        icon = "battery-ac-adapter";
      };
    };
  };

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "firefox.desktop";
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
