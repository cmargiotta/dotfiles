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
  };

  environment.systemPackages = with pkgs; [
    easyeffects
  ];

  programs.noisetorch.enable = true;
}
