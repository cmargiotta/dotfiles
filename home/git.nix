{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    delta.enable = false;
    lfs.enable = true;
    ignores = [ "*~" ];
    userName = "Carmine Margiotta";
    userEmail = "email@cmargiotta.net";
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
      http.lowSpeedTime = 600;
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
