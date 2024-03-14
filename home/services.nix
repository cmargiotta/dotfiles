{ config, pkgs, ... }:
{
  services = {
    gpg-agent =
      {
        enable = true;
        enableFishIntegration = true;
        enableExtraSocket = true;
        grabKeyboardAndMouse = true;
        pinentryPackage = pkgs.pinentry-gnome3;
        maxCacheTtl = 28800;
        defaultCacheTtl = 28800;
      };

    poweralertd.enable = true;
    kdeconnect.enable = true;
  };
}
