{ lib, stdenv, cmake }:

let
  pname = "myproject";
  version = "0.1.0";
in
  stdenv.mkDerivation
  {
    inherit pname;

    name = "${pname}-${version}";
    inherit version;

    src = lib.cleanSource ./.;

    nativeBuildInputs = [ cmake ];
  }
