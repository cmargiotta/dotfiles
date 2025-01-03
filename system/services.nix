{ inputs, pkgs, ... }:
let
  pkgs-hypr = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  services = {
    openssh.enable = true;
    pcscd.enable = true;
    printing.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    upower.enable = true;

    syncthing = {
      enable = true;
      user = "nychtelios";
      dataDir = "/home/nychtelios/.syncthing/data";
      configDir = "/home/nychtelios/.syncthing/config/syncthing";
      overrideDevices = true;
      overrideFolders = true;
      settings = {
        devices = {
          "device1" = {
            id = "T2PC4Q3-WS6RZGH-QD6JEO3-XW2W2JR-NGJAERK-VSJGDMG-4VPVUCP-QD3DSQF";
          };
        };
        folders = {
          "org" = {
            path = "/home/nychtelios/org"; # Which folder to add to Syncthing
            devices = [ "device1" ]; # Which devices to share the folder with
          };
        };
      };
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        domain = true;
        userServices = true;
      };
    };

    dbus.packages = [ pkgs.gcr ];

    # Permissions for JLink
    udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="1366", ATTR{idProduct}=="0101", MODE="0666", GROUP="plugdev"
      SUBSYSTEM=="usb", ATTR{idVendor}=="1366", ATTR{idProduct}=="1020", MODE="0666", GROUP="plugdev"

      # opendous and estick
      ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="204f", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Original FT232/FT245 VID:PID
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Original FT2232 VID:PID
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6010", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Original FT4232 VID:PID
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6011", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Original FT232H VID:PID
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6014", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # DISTORTEC JTAG-lock-pick Tiny 2
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="8220", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # TUMPA, TUMPA Lite
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="8a98", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="8a99", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # XDS100v2
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="a6d0", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Xverve Signalyzer Tool (DT-USB-ST), Signalyzer LITE (DT-USB-SLITE)
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="bca0", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="bca1", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # TI/Luminary Stellaris Evaluation Board FTDI (several)
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="bcd9", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # TI/Luminary Stellaris In-Circuit Debug Interface FTDI (ICDI) Board
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="bcda", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # egnite Turtelizer 2
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="bdc8", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Section5 ICEbear
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="c140", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="c141", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Amontec JTAGkey and JTAGkey-tiny
      ATTRS{idVendor}=="0403", ATTRS{idProduct}=="cff8", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Nuvoton NuLink
      ATTRS{idVendor}=="0416", ATTRS{idProduct}=="511b", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0416", ATTRS{idProduct}=="511c", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0416", ATTRS{idProduct}=="511d", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5200", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5201", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # TI ICDI
      ATTRS{idVendor}=="0451", ATTRS{idProduct}=="c32a", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # STMicroelectronics ST-LINK V1
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3744", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # STMicroelectronics ST-LINK/V2
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # STMicroelectronics ST-LINK/V2.1
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3752", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # STMicroelectronics STLINK-V3
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374d", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374e", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374f", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3753", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Cypress SuperSpeed Explorer Kit
      ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="0007", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Cypress KitProg in KitProg mode
      ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="f139", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Cypress KitProg in CMSIS-DAP mode
      ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="f138", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Hilscher NXHX Boards
      ATTRS{idVendor}=="0640", ATTRS{idProduct}=="0028", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Hitex STR9-comStick
      ATTRS{idVendor}=="0640", ATTRS{idProduct}=="002c", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Hitex STM32-PerformanceStick
      ATTRS{idVendor}=="0640", ATTRS{idProduct}=="002d", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Altera USB Blaster
      ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6001", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Amontec JTAGkey-HiSpeed
      ATTRS{idVendor}=="0fbb", ATTRS{idProduct}=="1000", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # SEGGER J-Link
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0101", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0102", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0103", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0104", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0105", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0107", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="0108", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1010", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1011", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1012", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1013", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1014", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1015", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1016", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1017", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1018", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1051", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1366", ATTRS{idProduct}=="1061", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Raisonance RLink
      ATTRS{idVendor}=="138e", ATTRS{idProduct}=="9000", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Debug Board for Neo1973
      ATTRS{idVendor}=="1457", ATTRS{idProduct}=="5118", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Olimex ARM-USB-OCD
      ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="0003", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Olimex ARM-USB-OCD-TINY
      ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="0004", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Olimex ARM-JTAG-EW
      ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="001e", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Olimex ARM-USB-OCD-TINY-H
      ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="002a", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Olimex ARM-USB-OCD-H
      ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="002b", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # USBprog with OpenOCD firmware
      ATTRS{idVendor}=="1781", ATTRS{idProduct}=="0c63", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # TI/Luminary Stellaris In-Circuit Debug Interface (ICDI) Board
      ATTRS{idVendor}=="1cbe", ATTRS{idProduct}=="00fd", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # TI XDS110 Debug Probe (Launchpads and Standalone)
      ATTRS{idVendor}=="0451", ATTRS{idProduct}=="bef3", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="0451", ATTRS{idProduct}=="bef4", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="1cbe", ATTRS{idProduct}=="02a5", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # TI Tiva-based ICDI and XDS110 probes in DFU mode
      ATTRS{idVendor}=="1cbe", ATTRS{idProduct}=="00ff", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Ambiq Micro EVK and Debug boards.
      ATTRS{idVendor}=="2aec", ATTRS{idProduct}=="6010", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="2aec", ATTRS{idProduct}=="6011", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="2aec", ATTRS{idProduct}=="1106", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Marvell Sheevaplug
      ATTRS{idVendor}=="9e88", ATTRS{idProduct}=="9e8f", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Keil Software, Inc. ULink
      ATTRS{idVendor}=="c251", ATTRS{idProduct}=="2710", MODE="660", GROUP="plugdev", TAG+="uaccess"
      ATTRS{idVendor}=="c251", ATTRS{idProduct}=="2750", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # CMSIS-DAP compatible adapters
      ATTRS{product}=="*CMSIS-DAP*", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # Raspberry Pi Picoprobe
      ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0004", MODE="660", GROUP="plugdev", TAG+="uaccess"

      # This rule is needed for basic functionality of the controller in Steam and keyboard/mouse emulation
      SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"

      # This rule is necessary for gamepad emulation; make sure you replace 'pgriffais' with a group that the user that runs Steam belongs to
      KERNEL=="uinput", MODE="0660", GROUP="pgriffais", OPTIONS+="static_node=uinput"

      # Valve HID devices over USB hidraw
      KERNEL=="hidraw*", ATTRS{idVendor}=="28de", MODE="0666"

      # Valve HID devices over bluetooth hidraw
      KERNEL=="hidraw*", KERNELS=="*28DE:*", MODE="0666"

      # DualShock 4 over USB hidraw
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", MODE="0666"

      # DualShock 4 wireless adapter over USB hidraw
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", MODE="0666"

      # DualShock 4 Slim over USB hidraw
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"

      # DualShock 4 over bluetooth hidraw
      KERNEL=="hidraw*", KERNELS=="*054C:05C4*", MODE="0666"

      # DualShock 4 Slim over bluetooth hidraw
      KERNEL=="hidraw*", KERNELS=="*054C:09CC*", MODE="0666"

      # Nintendo Switch Pro Controller over USB hidraw
      KERNEL=="hidraw*", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="2009", MODE="0666"

      # Nintendo Switch Pro Controller over bluetooth hidraw
      KERNEL=="hidraw*", KERNELS=="*057E:2009*", MODE="0666"
    '';
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      # pkgs-hypr.xdg-desktop-portal-hyprland
      # pkgs-hypr.xdg-desktop-portal-gtk
    ];
  };

  xdg.menus.enable = true;
  xdg.autostart.enable = true;
}
