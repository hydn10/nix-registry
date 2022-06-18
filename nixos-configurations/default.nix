{ self, system, nixpkgs, home-manager, nixos-wsl }:

{
  #HYDN-BEDROOM = import ./HYDN-BEDROOM { inherit self system nixpkgs home-manager nixos-wsl; };
}
//
import ./wsl-configs { inherit self system nixpkgs home-manager nixos-wsl; }
