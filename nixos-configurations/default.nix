{ self, system, nixpkgs, home-manager, nixos-wsl }:

{
  HYDN-BEDROOM = import ./HYDN-BEDROOM { inherit self system nixpkgs home-manager nixos-wsl; };
}
