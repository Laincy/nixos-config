{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/laincy
		../common/opts/pipewire.nix
  	../common/opts/nerdfonts/aurulent.nix
	];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "axiom";

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
  system.stateVersion = "24.05";

  services.greetd = {
    enable = true;
    settings = {
      default_session.command = "tuigreet --cmd Hyprland";
    };
  };
}
