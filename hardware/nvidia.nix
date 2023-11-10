{ config, pkgs, lib, ... }:
{
  config = {
    boot.extraModprobeConfig = ''
      options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3 nvidia_drm.modeset=1"
    '';

    hardware.nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = true;
      open = false;
      nvidiaSettings = true;
    };

    services.xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };
}
