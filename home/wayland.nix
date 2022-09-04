{ config, pkgs, nixpkgs, eww, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    flameshot
    lxappearance
    swaybg
    slurp
    wofi
    waybar
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
}
