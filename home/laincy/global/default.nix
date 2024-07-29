{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./nushell.nix
    ./git.nix
    ../../../modules/home-manager
  ];

  home = let
    nixvim = inputs.nixvim-config.packages.${pkgs.system}.default.extend config.nvext;
  in {
    username = lib.mkDefault "laincy";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.11";
    packages = [
      nixvim
      pkgs.ripgrep
		];
  };
}
