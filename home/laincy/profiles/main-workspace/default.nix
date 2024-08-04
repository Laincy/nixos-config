{pkgs, ...}: {
  #Hyprland configuration with rose pine
  imports = [
    ./hyprland.nix
    ./programs
    ./fenix.nix
    ./fonts.nix
    ./gtk.nix
    ./ags
  ];

	home.packages = with pkgs; [
		vesktop
	];
}
