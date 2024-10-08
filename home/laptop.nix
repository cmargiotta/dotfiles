{ pkgs, ... }:
{
  home.file.sshpub = {
    source = ../secrets/laptop-wsense/ssh_pub;
    target = ".ssh/id_ed25519.pub";
  };

  home.file.sshpriv = {
    source = ../secrets/laptop-wsense/ssh_priv;
    target = ".ssh/id_ed25519";
  };

  home.packages = with pkgs; [ brightnessctl ];

  xdg.desktopEntries = {
    mcuxpresso-ide = {
      name = "MCUXpresso IDE";
      genericName = "MCUXpresso IDE";
      terminal = false;
      categories = [ "Development" ];
      mimeType = [ "x-scheme-handler/eclipse" ];
      icon = ./icons/mcuxpresso-ide.png;
      exec = "sh -c \"podman-compose -f ~/ides/mcuxpresso-ide/docker-compose.yml up\"";
    };
    stm32cubeide = {
      name = "STM32Cube IDE";
      genericName = "STM32Cube IDE";
      terminal = false;
      categories = [ "Development" ];
      mimeType = [ "x-scheme-handler/eclipse" ];
      icon = ./icons/mcuxpresso-ide.png;
      exec = "sh -c \"podman-compose -f ~/ides/stm32cube-ide/docker-compose.yml up\"";
    };
  };
}
