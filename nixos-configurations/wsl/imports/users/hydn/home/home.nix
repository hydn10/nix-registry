{ pkgs, ... }:

{
  imports = [
    ./nixpkgs
    ./bash
    #./zsh
    ./neovim
    ./git
  ];

  home.packages = with pkgs; [
    ranger
    exa
  ];

  nix.registry.hydn.to = {
    type = "github";
    owner = "hydn10";
    repo = "nix-registry";
  };
}
