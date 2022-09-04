{ config, pkgs, nur, ... }:
{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      bitwarden
      bypass-paywalls-clean
      consent-o-matic
      ublock-origin
    ];
    profiles.adam = {
      bookmarks = {
        home-manager.url = "https://rycee.gitlab.io/home-manager/options.html";
      };
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "privacy.resistFingerprinting" = true;
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "browser.startup.homepage" = "http://192.168.1.92:8005/";
        "general.useragent.locale" = "it-IT";
      };
    };
  };
}