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
    (nerdfonts.override { fonts = [ "Monoid" "Hack" ]; })
    symbola
  ];

  gtk.font = {
    name = "Public Sans";
    package = pkgs.public-sans;
  };
}
