{ ... }:
{
  imports = [
    ../secrets/wireguard.nix
    ../secrets/wifi.nix
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Name = "nixos-cmargiotta";
        AutoConnectTimeout = 1200;
        Enable = "Source,Sink,Media,Socket";
        PairableTimeout = 0;
        FastConnectable = true;
        JustWorksRepairing = "always";
        ControllerMode = "dual";
        Privacy = "device";
      };

      Policy = {
        ReconnectAttempts = 30;
        ReconnectIntervals = "1,2,4,8";
        AutoEnable = true;
      };
    };
  };
}
