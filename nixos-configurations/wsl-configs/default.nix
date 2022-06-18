{ self, system, nixpkgs, home-manager, nixos-wsl }:

let
  allHostNames = f: hnList: builtins.listToAttrs (builtins.map (e: { name = e; value = f e;}) hnList);
  hostNames = import ./hostNames.nix;
  hostNameToHostNameModule = hn: { ... }: { networking.hostName = hn; };
  hostNameToNixosConfig = hn:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit nixpkgs home-manager nixos-wsl; };
      modules = [
        self.nixosModules.wsl
        (hostNameToHostNameModule hn)
      ];
    };
in
  allHostNames hostNameToNixosConfig hostNames
