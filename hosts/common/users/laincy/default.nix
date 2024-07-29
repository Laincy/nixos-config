{
  config,
  pkgs,
  inputs,
  outputs,
  system,
  ...
}: {
  users.users.laincy = {
    isNormalUser = true;
    description = "main user account";
    extraGroups = ["networkmanager" "wheel" "pipewire"];
    shell = pkgs.nushell;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs system;};
    users.laincy = import ../../../../home/laincy/${config.networking.hostName + ".nix"};
  };
}
