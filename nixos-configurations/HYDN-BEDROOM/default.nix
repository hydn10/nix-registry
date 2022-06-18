{ self, system, nixpkgs, home-manager, nixos-wsl }:

let
  hostName = "HYDN-BEDROOM";
  hostNameModule = { ... }: { networking.hostName = hostName; };
in
  nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit nixpkgs home-manager nixos-wsl; };
    modules = [
      self.nixosModules.wsl
      hostNameModule
    ];
  }
