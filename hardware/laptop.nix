# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libdrm
    libvdpau-va-gl
    libva
    libva-utils
    libglvnd
    vulkan-validation-layers
    vulkan-extension-layer
    vulkan-tools
    vulkan-loader
    vulkan-tools
  ];

  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/d38e8164-b57d-47fa-8681-5ac4e1a37d39";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/F5EE-45C2";
      fsType = "vfat";
    };

  swapDevices =
    [
      { device = "/dev/disk/by-uuid/f4ec9dff-d63b-44a2-ad4f-70e70f3b93a8"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
