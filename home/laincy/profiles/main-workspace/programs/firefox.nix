{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles.laincy = {
      search.default = "DuckDuckGo";

      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        bitwarden
        ublock-origin
      ];
    };
  };
}
