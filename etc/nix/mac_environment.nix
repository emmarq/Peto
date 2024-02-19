{ jdk17, xcodeenv, darwin, callPackage, mkShell }:
let
  xcode = xcodeenv.composeXcodeWrapper {
    version = "15.2";
    xcodeBaseDir = "/Applications/Xcode.app";
  };
  android_packages = callPackage ./android_derivation.nix { };
  ruby_packages = callPackage ./ruby_derivation.nix { };
  buildInputs = [ xcode darwin.ios-deploy ] ++ callPackage ./inputs.nix { inherit android_packages; inherit ruby_packages; };
  script = import ./shellHook.nix;
  shellHook = script.shellHook + ''
    mkdir -p ~/.macbin
    ln -s -f /usr/bin/sed ~/.macbin/sed 
    ln -s -f /usr/bin/find ~/.macbin/find 
    export PATH=~/npm-packages/bin:~/yarn-packages/bin:${xcode}/bin:~/.macbin:$PATH
  ''
  ;
in
mkShell ({
  name = "React native dev env for mac";
  inherit buildInputs;
  inherit shellHook;
} // import ./env.nix { inherit jdk17; inherit (android_packages) androidsdk; })
