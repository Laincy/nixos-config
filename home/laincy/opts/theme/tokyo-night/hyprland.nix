{...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = "master";
      border_size = 0;
    };
    decoration = {
      rounding = 10;
    };
    exec-once = ["hyprpaper"];
  };

  services.hyprpaper.settings = {
    preload = ["${./wallpapers/outing.jpg}"];
		wallpaper = [",${./wallpapers/outing.jpg}"];
    ipc = "on";
    splash = false;
  };
}
