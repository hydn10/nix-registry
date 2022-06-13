{
  description = "";

  outputs = { self, nixpkgs }:
    let
      pkgs-lin64 = import nixpkgs { system = "x86_64-linux"; };
      packageDrv-lin64 = pkgs-lin64.callPackage ./default.nix {};
    in
    {
      apps.x86_64-linux.myapp = 
      {
        type = "app";
        program = "${packageDrv-lin64}/bin/myapp";
      };

      apps.x86_64-linux.default = self.apps.x86_64-linux.myapp;

      overlays.default = final: prev: { myproject = self.packages.x86_64-linux.myproject; };

      packages.x86_64-linux.myproject = packageDrv-lin64;

      packages.x86_64-linux.default = self.packages.x86_64-linux.myproject;

      devShells.x86_64-linux.default = import ./shell.nix {
        pkgs = pkgs-lin64;
        pkg = packageDrv-lin64;
      };
    };
}
