{
  pkgs,
  inputs,
  lib,
  ...
}: let
  mtab = inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon {
    pname = "mtab";
    version = "1.3.4";
    addonId = "contact@maxhu.dev";
    url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/mtab/1.3.4.xpi";
    sha256 = "e3b2f4696d78d8886d0e4a98404a211c96959e43046d73dbe69f74591935d9a6";
    meta = with lib; {
      homepage = "https://github.com/maxhu08/mtab";
      description = "lightweight new tab page extension";
      license = licenses.mit;
      platform = platforms.all;
      mozPermissions = [
        "bookmarks"
      ];
    };
  };

  nur-firefox = inputs.firefox-addons.packages.${pkgs.system};
in {
  programs.firefox = {
    enable = true;

    profiles.laincy = {
      id = 0;
      isDefault = true;
      search.default = "DuckDuckGo";

      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.feeds.showFirstRunUI" = false;
        "trailhead.firstrun.didSeeAboutWelcome" = true;
      };

      extensions = [
        mtab
        nur-firefox.bitwarden
        nur-firefox.ublock-origin
      ];
    };
  };
}
