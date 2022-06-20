{ self, system, nixpkgs, home-manager, nixos-wsl }:

{
}
//
import ./wsl-configs { inherit self nixpkgs home-manager nixos-wsl; }
