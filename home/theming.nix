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
      bookmarks = [
        "file:///home/demeter/Documents"
        "file:///home/demeter/Music"
        "file:///home/demeter/Pictures"
        "file:///home/demeter/Videos"
        "file:///home/demeter/Downloads"
        "file:///home/demeter/Projects Projects"
        "file:///home/demeter/School School"
      ];
      extraCss = ''
        headerbar, .titlebar,
        .csd:not(.popup):not(tooltip):not(messagedialog) decoration{ border-radius: 0; }
      '';
    };
  };
}
