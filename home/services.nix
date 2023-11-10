{ config, pkgs, ... }:
{
  services.gpg-agent =
    {
      enable = true;
      enableZshIntegration = true;
      pinentryFlavor = "qt";
      maxCacheTtl = 28800;
      defaultCacheTtl = 28800;
    };
}
