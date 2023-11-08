{ config, pkgs, lib, ... }:
{
  config = {
    hardware.opengl.enable = true;
    hardware.opengl.driSupport = true;
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;

    boot.extraModprobeConfig = ''
      options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3 nvidia_drm.modeset=1"
    '';

    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    hardware.nvidia.powerManagement.enable = true;
    hardware.nvidia.open = false;
    hardware.nvidia.nvidiaSettings = true;

    services.xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };
}
