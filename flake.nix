{
  inputs = {
    nixpkgs.url = "nixpkgs";
    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    packages = import ./packages { inherit self nixpkgs; };

    nixosModules = import ./nixos-modules;

    nixosConfigurations =
      let
        system = "x86_64-linux";
        home-manager = inputs.home-manager;
        nixos-wsl = inputs.nixos-wsl;
      in
      import ./nixos-configurations { inherit self system nixpkgs home-manager nixos-wsl; };

    templates = import ./templates { inherit self; };
  };
}
