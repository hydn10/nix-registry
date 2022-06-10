{ pkgs, ... }:

let
  nixpkgs-config-path = ./nixpkgs-config.nix;
in
{
  # As explained here:
  # https://rycee.gitlab.io/home-manager/options.html#opt-nixpkgs.config
  nixpkgs.config = import nixpkgs-config-path;
  xdg.configFile."nixpkgs/config.nix".source = nixpkgs-config-path;
}
