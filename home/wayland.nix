{ config, pkgs, nixpkgs, eww, unstable, ... }:
{
  home.packages = with pkgs; [
    grimblast
    lxappearance
    slurp
    swaybg
    waybar
    wl-clipboard
    wofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal
  ];

  home.file.wofi = {
    source = ./config/wofi;
    target = ".config/wofi";
    recursive = true;
  };

  home.file.waybar_style = {
    source = ./config/waybar/style.css;
    target = ".config/waybar/style.css";
  };

  wayland.windowManager.hyprland.enable = true;

  home.pointerCursor = {
    name = "Nordzy-white-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 32;
    gtk.enable = true;
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
    QT_QPA_PLATFORM = "wayland;xcb";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_RENDERER = "vulkan";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = 1;
  };
}
