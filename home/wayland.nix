{ config, pkgs, nixpkgs, eww, unstable, hyprland, ... }:
{
  home.packages = with pkgs; [
    grimblast
    slurp
    swww
    waybar
    wl-clipboard
    wofi
    wlr-randr
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal
    xwayland
    swayosd
    nwg-panel
  ];

  home.file.wofi = {
    source = ./config/wofi;
    target = ".config/wofi";
    recursive = true;
  };

  home.file.lock = {
    source = ./config/lock.sh;
    target = ".config/swaylock.sh";
    recursive = true;
    executable = true;
  };

  home.file.dunst = {
    source = ./config/dunst;
    target = ".config/dunst/config";
  };

  home.file.waybar_style = {
    source = ./config/waybar/style.css;
    target = ".config/waybar/style.css";
  };

  home.file.nwg-panel-settings = {
    source = "./config/nwg-panel/common-settings.json";
    target = ".config/nwg-panel/common-settings.json";
  };

  home.file.nwg-panel-config = {
    source = "./config/nwg-panel/config";
    target = ".config/nwg-panel/config";
  };

  home.file.nwg-panel-css = {
    source = "./config/nwg-panel/style.css";
    target = ".config/nwg-panel/style.css";
  };

  wayland.windowManager.hyprland =
    {
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

  home.pointerCursor = {
    name = "Nordzy-cursors-white";
    package = pkgs.nordzy-cursor-theme;
    size = 32;
    gtk.enable = true;
  };

  services = {
    dunst = {
      enable = true;
      configFile = "$XDG_CONFIG_HOME/dunst/config";
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
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_RENDERER = "vulkan";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    GDK_BACKEND = "wayland";
    NIXOS_OZONE_WL = "1";
  };
}
