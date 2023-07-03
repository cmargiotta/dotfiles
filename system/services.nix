{ lib, config, pkgs, ... }:
{
  services.openssh.enable = true;
  services.pcscd.enable = true;
  services.printing.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.dbus.packages = [ pkgs.gcr ];

  # Permissions for JLink
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="1366", ATTR{idProduct}=="0101", MODE="0666", GROUP="plugdev"
  '';

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    jack.enable = true;
    pulse.enable = true;

    socketActivation = true;
  };
}
