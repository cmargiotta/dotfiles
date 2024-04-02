# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva
        qt6.qtwayland
        vaapiVdpau
        libvdpau-va-gl
        libsForQt5.qt5ct
        nvidia-vaapi-driver
      ];
      extraPackages = with pkgs; [
        libva
        qt6.qtwayland
        libsForQt5.qt5ct
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      powerManagement.enable = true;
      open = true;
      nvidiaSettings = true;
    };

    xpadneo.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Name = "nixos-desktop";
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

    pulseaudio.support32Bit = true;
  };

  services.xserver = {
    videoDrivers = [ "nvidia" "fbdev" ];
  };

  boot = {
    extraModprobeConfig = ''
      options nvidia_drm fbdev=1
      options bluetooth disable_ertm=1
    '';

    kernelPackages = pkgs.linuxPackages_zen;
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [
      pkgs.linuxKernel.packages.linux_zen.asus-wmi-sensors
    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4aeb1db7-9fbd-4bf2-b66e-2fd04df50000";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3F06-E1AD";
    fsType = "vfat";
  };

  fileSystems."/home/nychtelios" = {
    device = "/dev/disk/by-uuid/eb917002-8a95-40c5-ae1b-64545bf1e750";
    fsType = "ext4";
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
  ];

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.wireless.enable = lib.mkDefaut false;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
