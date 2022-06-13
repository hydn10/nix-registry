{
  inputs = {
    nixpkgs.url = "nixpkgs";
    home-manager.url = "home-manager";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations =
      let
        home-manager = inputs.home-manager;
        nixos-wsl = inputs.nixos-wsl;
      in
      import ./nixos-configurations { inherit self nixpkgs home-manager nixos-wsl; };

    templates = import ./templates { inherit self; };
  };
}

