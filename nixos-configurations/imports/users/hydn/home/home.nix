{ pkgs, ... }:

{
  imports = [
    ./nixpkgs
    ./bash
    ./neovim
    ./git
  ];

  home.packages = with pkgs; [
    ranger
    exa
  ];
}
