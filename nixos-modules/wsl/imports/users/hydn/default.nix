{ config, pkgs, ... }:

{
  users.users.hydn = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    #shell = pkgs.zsh;
  };

  # For zsh completion, as per [1].
  # [1]: https://nix-community.github.io/home-manager/options.html#opt-programs.zsh.enableCompletion
  #environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.hydn = { ... }: {
    imports = [ ./home/home.nix ];
    home.stateVersion = "22.05";
  };
}
