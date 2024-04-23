{ pkgs, lib, config, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    cabin
    cascadia-code
    dejavu_fonts
    fira
    fira-code
    nerdfonts
    font-manager
    symbola
  ];

  home.pointerCursor = {
    name = "Nordzy-cursors-white";
    package = pkgs.nordzy-cursor-theme;
    size = 32;
    gtk.enable = true;
  };

  gtk = {
    enable = true;

    font = {
      name = "Public Sans";
      package = pkgs.public-sans;
      size = 12;
    };

    gtk3 = {
      extraCss = ''
        headerbar, .titlebar,
        .csd:not(.popup):not(tooltip):not(messagedialog) decoration{ border-radius: 0; }
      '';
    };

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
