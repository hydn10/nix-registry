{ self, nixpkgs, home-manager, nixos-wsl }:

let
  system = "x86_64-linux";

  allHostNames = f: hnList: builtins.listToAttrs (builtins.map (e: { name = e; value = f e;}) hnList);
  hostNames = import ./hostNames.nix;

  mkHostNameModule = hn: { ... }: { networking.hostName = hn; };

  hostNameToNixosConfig = hn:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit nixpkgs home-manager nixos-wsl; };
      modules = [
        self.nixosModules.wsl
        (mkHostNameModule hn)
      ];
    };
in
  allHostNames hostNameToNixosConfig hostNames
