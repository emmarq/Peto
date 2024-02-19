{ bundlerEnv }:
let
  gems = bundlerEnv {
    name = "gems-for-peto";
    gemdir = ./.;
    gemfile = ../../Gemfile;
    lockfile = ../../Gemfile.lock;
  };
in
{
  inherit gems;
  ruby = gems.wrappedRuby;
}
