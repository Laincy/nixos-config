{inputs, ...}: {
  home.packages = [
    inputs.fenix.packages.x86_64-linux.complete.toolchain
  ];
}
