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
    eza
  ];

  nix.registry.hydn.to = {
    type = "github";
    owner = "hydn10";
    repo = "nix-registry";
  };
}
