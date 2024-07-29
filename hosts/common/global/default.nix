{pkgs, ...}: {
  imports = [
    ./localization.nix
    ./home-manager.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
  ];
}
