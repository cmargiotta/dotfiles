{ config, pkgs, ... }:
{
  services.blueman-applet.enable = true;

  services.gpg-agent =
    {
      enable = true;
      pinentryFlavor = "gtk2";
    };

  services.flameshot = {
    enable = false;
    settings = {
      General = {
        checkForUpdates = false;
        contrastOpacity = 188;
        disabledTrayIcon = false;
        saveAsFileExtension = "png";
        savePath = "~/Pictures/screenshots";
      };
    };
  };
}
