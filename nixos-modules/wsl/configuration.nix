{ lib, config, pkgs, modulesPath, ... }:

with lib;
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
    imports/users/nixos
  ];

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "hydn";
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ git vim ];

  # Enable nix flakes
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "22.05";
}
