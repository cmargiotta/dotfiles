{ config, pkgs, lib, ... }:
let
  nvidiaPackage = config.boot.kernelPackages.nvidiaPackages.beta;
in
{
  config = {
    environment.etc."gbm/nvidia-drm_gbm.so".source = "${nvidiaPackage}/lib/libnvidia-allocator.so";
    environment.etc."egl/egl_external_platform.d".source = "/run/opengl-driver/share/egl/egl_external_platform.d/";
    hardware.opengl.enable = true;
    hardware.opengl.driSupport = true;
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;
    hardware.opengl.extraPackages = with pkgs; [
      libva
      nvidia-vaapi-driver
    ];
    environment.systemPackages = with pkgs; [
      egl-wayland
    ];

    boot.extraModprobeConfig = ''
      options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3"
    '';

    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.package = nvidiaPackage;
    hardware.nvidia.powerManagement.enable = true;
    hardware.nvidia.open = true;
    hardware.nvidia.nvidiaSettings = true;

    services.xserver = {
      enable = true;
      autorun = false;
      videoDrivers = [ "nvidia" ];
      displayManager = {
        gdm = {
          wayland = true;
          enable = true;
        };
      };
    };
  };
}
