{ callPackage, lib }:
let
  info = lib.splitString "-" builtins.currentSystem;
  arch = lib.elemAt info 0;
  os = lib.elemAt info 1;
  isMacM1M2 = os == "darwin" && arch == "aarch64";
  isIntelMac = os == "darwin" && arch == "x86_64";
  isLinux = os == "linux";

  android-nixpkgs = callPackage
    (import (builtins.fetchGit {
      url = "https://github.com/tadfisher/android-nixpkgs.git";
      ref = "refs/tags/2023-12-04";
    }))
    {
      channel = "stable";
    };
  androidsdk = android-nixpkgs.sdk
    (sdkPkgs: with sdkPkgs; let
      android-image =
        if isMacM1M2 then [ system-images-android-33-google-apis-arm64-v8a ]
        else [
          system-images-android-33-google-apis-playstore-x86-64
        ];
    in
    [
      cmdline-tools-latest
      platform-tools
      emulator
      platforms-android-34
      build-tools-34-0-0
    ] ++ android-image);

in
{
  inherit androidsdk;
}
