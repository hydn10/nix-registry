{ config, pkgs, ... }:

{
  users.users.hydn = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.hydn = { ... }: {
    imports = [ ./home/home.nix ];
    home.stateVersion = "22.05";
  };
}
