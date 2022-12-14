{ config, pkgs, nur, ... }:
{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      behind-the-overlay-revival
      bitwarden
      c-c-search-extension
      clearurls
      consent-o-matic
      don-t-fuck-with-paste
      enhancer-for-youtube
      firefox-color
      flagfox
      floccus
      gaoptout
      ghostery
      grammarly
      ninja-cookie
      no-pdf-download
      octotree
      search-by-image
      skip-redirect
      sourcegraph
      terms-of-service-didnt-read
      tokyo-night-v2
      ubo-scope
      unpaywall
      wayback-machine
    ];
    profiles.nychtelios = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "http://192.168.1.92:8005/";
        "browser.toolbars.bookmarks.visibility" = "always";
        "extensions.pocket.enabled" = false;
        "general.useragent.locale" = "it-IT";
        "identity.fxaccounts.enabled" = false;
        "privacy.resistFingerprinting" = true;
        "signon.rememberSignons" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
