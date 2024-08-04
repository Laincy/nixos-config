{
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;

    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };

    iconTheme.name = "rose-pine-icons";
  };
}
