{ sources ? import ./etc/nix/sources.nix, pkgs ? import sources.nixpkgs {} }:
with pkgs;
let 
packages = {
  mac = callPackage ./etc/nix/mac_environment.nix { };
  linux = callPackage ./etc/nix/linux_environment.nix { };
};
in
packages
