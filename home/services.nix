{ config, pkgs, ... }:
{
  services.blueman-applet.enable = true;

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
