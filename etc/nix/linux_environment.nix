{ jdk17, callPackage, mkShell }:
let
  android_packages = callPackage ./android_derivation.nix { };
  ruby_packages = callPackage ./ruby_derivation.nix { };
  buildInputs = callPackage ./inputs.nix { inherit android_packages; inherit ruby_packages; };
  script = import ./shellHook.nix;
  shellHook = script.shellHook + ''
    export PATH=~/npm-packages/bin:~/yarn-packages/bin:$PATH
  ''
  ;
in
mkShell ({
  name = "React native dev env for linux";
  inherit buildInputs;
  inherit shellHook;
} // import ./env.nix { inherit jdk17; inherit (android_packages) androidsdk; })
