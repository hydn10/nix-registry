{
  inputs = {
    #nixpkgs.url = "nixpkgs/nixos-22.05";
    nixpkgs.url = "nixpkgs";
    #home-manager.url = "home-manager/release-22.05";
    home-manager.url = "home-manager";
  };

  outputs = { self, nixpkgs, home-manager }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ ./configuration.nix ];
    };
  };
}
