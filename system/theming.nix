{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    targets.fish.enable = false;
    polarity = "light";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/primer-light.yaml";

    cursor = {
      package = pkgs.nordzy-cursor-theme;
      size = 32;
      name = "Nordzy-cursors-white";
    };

    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    };

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.iosevka;
        name = "Iosevka Term";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
