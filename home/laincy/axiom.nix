{lib, ...}: {
  imports = [
    ./global
    ./opts/desktop/hyprland
		./opts/program/alacritty
    ./opts/program/fuzzel
    ./opts/program/firefox
    ./opts/tool/fenix
    ./opts/theme/tokyo-night
	];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [];

  monitors = [
    {
      name = "eDP-1";
      width = 2880;
      height = 1800;
      hz = 120;
      x = 0;
      y = 0;
      scale = "2";
      enabled = true;
    }
  ];

  prefs = {
    terminal = "alacritty";
    editor = "nvim";
    browser = "firefox";
    menu = "fuzzel";
  };
}
