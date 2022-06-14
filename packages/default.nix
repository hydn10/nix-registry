{ self, nixpkgs }:

{
  x86_64-linux = 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      hyde = pkgs.callPackage ./hyde {};
    };
}
