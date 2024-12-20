{ pkgs, config, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    cabin
    cascadia-code
    dejavu_fonts
    fira
    fira-code
    nerdfonts
    symbola
  ];

  stylix.targets = {
    waybar.enable = false;
    vscode.enable = false;
  };

  gtk = {
    enable = true;

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
  };
}
