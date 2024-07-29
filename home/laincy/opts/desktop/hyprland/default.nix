{
  pkgs,
  config,
  ...
}: {
  services.hyprpaper.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    OBSIDIAN_USE_WAYLAND = 1;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    package = pkgs.hyprland;

    settings = {
      monitor =
        map (
          m: let
            resolution = "${toString m.width}x${toString m.height}@${toString m.hz}";
            position = "${toString m.x}x${toString m.y}";
          in "${m.name},${
            if m.enabled
            then "${resolution},${position},${m.scale}"
            else "disable"
          }"
        )
        (config.monitors);
      input.touchpad.natural_scroll = true;
      "$mod" = "SUPER";
      "$terminal" = config.prefs.terminal;
      "$menu" = config.prefs.menu;

      bind = import ./binds.nix;
    };
  };
}
