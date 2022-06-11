{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;

    # Also needs to add `environment.pathsToLink = [ "/share/zsh" ]` as per [1].
    # [1]: https://nix-community.github.io/home-manager/options.html#opt-programs.zsh.enableCompletion
    enableCompletion = true;

    enableSyntaxHighlighting = true;

    history = {
      size = 10000;
    };

    shellAliases = {
      v = "vim";
      r = "ranger";
      g = "git";

      ls = "exa --group-directories-first";
      l = "ls -lahg";
      la = "ls -a";
      lst = "ls -T";

      ip = "ip --color=auto";
    };

    initExtra = ''
      # Disable ctrl-s and ctrl-q. I think it has other side effects.
      # No idea if it needs to be set with ZSH, I think it should.
      stty -ixon

      # NixOS default alias, for some reason. See [1].
      # [1]: https://github.com/NixOS/nixpkgs/blob/760b677c19ba6b1e6988e72c912270a561516939/nixos/modules/config/shells-environment.nix#L162
      unalias ll

      PS1="\[\033[01;00m\][ \[\033[01;32m\]\u\[\033[01;00m\]: \[\033[01;34m\]\w\[\033[01;00m\] \[\033[01;00m\]]\[\033[01;00m\]$ \[\033[00m\]"
      
      # Needed in WSL for sessionVariables to work since we don't have a
      # graphical interface. See [1]:
      # https://discourse.nixos.org/t/home-manager-doesnt-seem-to-recognize-sessionvariables/8488/7
      . $HOME/.profile
    '';

    sessionVariables = {
      EDITOR = "vim";
    };
  };
}
