{ self, nixpkgs, home-manager, nixos-wsl }@inputs:

{
  wsl = import ./wsl { inherit self nixpkgs home-manager nixos-wsl; };
}
