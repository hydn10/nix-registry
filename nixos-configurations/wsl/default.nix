{ self, nixpkgs, home-manager, nixos-wsl }@inputs:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = inputs;
  modules = [ ./configuration.nix ];
}
