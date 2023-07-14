{ config, pkgs, nixpkgs, eww, unstable, hyprland, ... }:
{
  home.packages = with pkgs; [
    # grimblast
    grimblast
    hyprland
    hyprland-protocols
    hyprland-share-picker
    nwg-panel
    slurp
    swayosd
    swww
    waybar
    wl-clipboard
    wlr-randr
    wofi
    xdg-desktop-portal-hyprland

    xorg.xprop
  ];

  home.file.wofi = {
    source = ./config/wofi;
    target = ".config/wofi";
    recursive = true;
  };

  home.file.lock = {
    source = ./config/lock.sh;
    target = ".config/swaylock.sh";
    executable = true;
  };

  home.file.panel_settings = {
    source = ./config/panel/common-settings.json;
    target = ".config/nwg-panel/common-settings.json";
  };

  home.file.panel_config = {
    source = ./config/panel/config;
    target = ".config/nwg-panel/config";
  };

  home.file.waybar = {
    source = ./config/waybar/config;
    target = ".config/waybar/config";
  };

  home.file.dunst = {
    source = ./config/dunst;
    target = ".config/dunst/config";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  services = {
    dunst = {
      enable = true;
      configFile = "$XDG_CONFIG_HOME/dunst/config";
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

  gtk = {
    enable = true;

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Catppuccin-Purple-Dark-Compact";
      package = pkgs.catppuccin-gtk.override { size = "compact"; };
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORM = "wayland;xcb";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_RENDERER = "vulkan";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    NIXOS_OZONE_WL = "1";
  };
}
