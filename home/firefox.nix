{ config, pkgs, nur, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.nychtelios = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "http://192.168.1.92:3000/";
        "browser.toolbars.bookmarks.visibility" = "always";
        "extensions.pocket.enabled" = false;
        "general.useragent.locale" = "it-IT";
        "identity.fxaccounts.enabled" = false;
        "privacy.resistFingerprinting" = false;
        "signon.rememberSignons" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "webgl.force-enabled" = true;
      };
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
        ghostery
        new-tab-override
        ninja-cookie
        no-pdf-download
        skip-redirect
        sourcegraph
        terms-of-service-didnt-read
        tokyo-night-v2
        ubo-scope
        unpaywall
        wayback-machine
      ];
    };
  };
}
