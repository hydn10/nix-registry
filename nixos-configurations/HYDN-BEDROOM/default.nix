{ self, system, nixpkgs, home-manager, nixos-wsl }:

nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit  nixpkgs home-manager nixos-wsl; };
  modules = [
    self.nixosModules.wsl
    ./configuration.nix
  ];
}
