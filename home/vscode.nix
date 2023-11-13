{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    extensions = map
      (extension: pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          inherit (extension) name publisher version sha256;
        };
      })
      (import ./vscode-extensions.nix).extensions;
  };
}
