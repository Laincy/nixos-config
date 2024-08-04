{
  pkgs,
  config,
  ...
}: {
  services.hyprpaper.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  services.hyprpaper.settings = {
    preload = ["${./wallpapers/newmessage.png}"];
    wallpaper = [",${./wallpapers/newmessage.png}"];
    ipc = "on";
    splash = false;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    package = pkgs.hyprland;

    settings = {
      general = {
        layout = "master";
        border_size = 2;

        "col.active_border" = "rgb(de6d73)";
        "col.inactive_border" = "rgb(21202e)";
      };
      decoration = {
        rounding = 10;
      };

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

      bind = [
        "$mod, q, exec, alacritty"
        "$mod, r, exec, fuzzel"
        "$mod, b, exec, firefox"

        "$mod, c, killactive"
        "$mod, l, exit"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];
    };
  };
}
