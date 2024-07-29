{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.laincy = {
      extensions = with inputs.firefox-addons.packages."${pkgs.system}"; [
        bitwarden
        ublock-origin
      ];
    };
  };
}
