{lib, ...}: {
  nvext = {
    colorschemes.rose-pine.enable = lib.mkForce false;
    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };
  };
}
