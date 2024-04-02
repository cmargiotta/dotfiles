{ lib, config, pkgs, ... }:
{
  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    socketActivation = true;

    lowLatency = {
      # enable this module
      enable = true;
      # defaults (no need to be set unless modified)
      quantum = 64;
      rate = 48000;
    };
  };

  environment.systemPackages = with pkgs; [
    easyeffects
  ];

  security.rtkit.enable = true;

  programs.noisetorch.enable = true;
}
