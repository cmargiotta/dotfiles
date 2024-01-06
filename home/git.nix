{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    delta.enable = true;
    ignores = [ "*~" ];
    userName = "Carmine Margiotta";
    userEmail = "cmargiotta@posteo.net";
    signing = {
      signByDefault = true;
      key = null;
    };
    extraConfig = {
      github.user = "cmargiotta";
      init.defaultBranch = "development";
      core.editor = "nano";
      merge.tool = "meld";
      pull.ff = "only";
    };
  };

  home.packages = with pkgs; [
    gitAndTools.git-annex
    gitAndTools.git-annex-remote-rclone
    gitAndTools.transcrypt
    git-crypt
    rclone
  ];
}
