{ pkgs, ... }:
{
  hardware.xone.enable = true;

  environment.systemPackages = with pkgs; [ nvidia-vaapi-driver ];

  services.printing = {
    enable = true;
    logLevel = "debug";
    browsing = true;

    drivers = [ pkgs.hplipWithPlugin ];
  };
}
