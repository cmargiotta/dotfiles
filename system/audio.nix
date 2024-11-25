{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    audio.enable = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    socketActivation = true;

    extraConfig.pipewire-pulse = {
      "100-custom"."pulse.cmd" = [
        {
          cmd = "load-module";
          args = "module-zeroconf-discover";
        }
      ];
    };

    lowLatency = {
      enable = true;
      quantum = 64;
      rate = 48000;
    };
  };

  environment.systemPackages = with pkgs; [
    # easyeffects
    pwvucontrol
  ];

  security.rtkit.enable = true;

  programs.noisetorch.enable = true;
}
