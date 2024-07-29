{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.nvext = mkOption {
    type = types.attrs;
    default = {};
  };
}
