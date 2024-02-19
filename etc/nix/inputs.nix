{ nodejs
, yarn
, jdk11
, bundix
, maestro
, deno
, act
, crowdin-cli
, android_packages
, ruby_packages
, neovim
, ripgrep
, fd
, lazygit
, scrcpy
, ffmpeg
, nixpkgs-fmt
, niv
, ...
}:
let
  inputs = [
    nodejs
    yarn
    jdk11
    bundix
    android_packages.androidsdk
    ruby_packages.ruby
    ruby_packages.gems
    neovim
    ripgrep
    fd
    lazygit
    scrcpy
    ffmpeg
    nixpkgs-fmt
    niv
  ];
in
inputs
