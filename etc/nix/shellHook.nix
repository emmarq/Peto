{
  shellHook = ''
    ln -s -f ../../etc/git_hooks/pre-commit.sh .git/hooks/pre-commit
    ln -s -f ../../etc/git_hooks/pre-push.sh .git/hooks/pre-push
    npm config set prefix '~/npm-packages'
    yarn config set prefix '~/yarn-packages'
    git update-index --skip-worktree etc/nix/env.nix
    chmod 755 ./etc/scripts/configure_avd.sh
    alias rmn="rm -rf node_modules package-lock.json && yarn && cd ios && rm -rf Pods Podfile.lock && bundle exec pod install && cd .."
  '';
}

