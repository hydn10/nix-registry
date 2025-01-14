{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      v = "vim";
      r = "ranger";
      g = "git";

      ls = "eza --group-directories-first";
      l = "ls -lahg";
      la = "ls -a";
      lst = "ls -T";
    };

    initExtra = ''
      PS1="\[\033[01;00m\][ \[\033[01;32m\]\u\[\033[01;00m\]: \[\033[01;34m\]\w\[\033[01;00m\] \[\033[01;00m\]]\[\033[01;00m\]$ \[\033[00m\]"
      
      # Needed in WSL for sessionVariables to work since we don't have a
      # graphical interface. See [1]:
      # https://discourse.nixos.org/t/home-manager-doesnt-seem-to-recognize-sessionvariables/8488/7
      . $HOME/.profile
    '';

    sessionVariables = {
      EDITOR = "vim";
    };

    bashrcExtra = ''
      # Disable ctrl-s and ctrl-q. I think it has other side effects.
      stty -ixon

      # NixOS default alias, for some reason. See [1].
      # [1]: https://github.com/NixOS/nixpkgs/blob/760b677c19ba6b1e6988e72c912270a561516939/nixos/modules/config/shells-environment.nix#L162
      unalias ll
    '';
  };
}
