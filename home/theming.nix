{ pkgs, lib, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    cabin
    dejavu_fonts
    fira
    fira-code
    font-manager
    iosevka
    symbola

    (nerdfonts.override {
      fonts = [
        "Monoid"
        "Hack"
      ];
    })
  ];

  home.pointerCursor = {
    name = "Nordzy-cursors-white";
    package = pkgs.nordzy-cursor-theme;
    size = 32;
    gtk.enable = true;
  };

  gtk = {
    font = {
      name = "Public Sans";
      package = pkgs.public-sans;
    };

    gtk3 = {
      extraCss = ''
        headerbar, .titlebar,
        .csd:not(.popup):not(tooltip):not(messagedialog) decoration{ border-radius: 0; }
      '';
    };
  };
}
