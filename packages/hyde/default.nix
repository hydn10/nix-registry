{
  stdenv,
  fetchFromGitHub,
  symlinkJoin,
  pkg-config,
  cmake,
  ninja,
  llvmPackages_12,
  boost
}:

let
  # TODO: Comment that it doesnt work with llvmPackages > 12.
  #       It is due to a library change, a constructor was marked as private.
  llvmPackages = llvmPackages_12;

  # Right now if boost > 1.69 is used we run into an issue that can be solved
  # by [1]. In theory it is patched upstream so it should not be a problem
  # when time to update comes, but I'll leave this comment just in case.
  # [1]: https://github.com/NixOS/nixpkgs/issues/63104#issuecomment-637451276
  boostStatic = boost.override {
    enableShared = false;
    enableStatic = true;
  };

in
  stdenv.mkDerivation
  {
    name = "hyde";
    version = "2022-03-18";

    src = fetchFromGitHub {
      owner = "adobe";
      repo = "hyde";
      rev = "8d9c64d1dc963a7df7c0c5500b12853b338fec2d";
      sha256 = "VNdwa224K74ZfweEYrsKO8Fh5I4xGHV2cfNAPsl3fTI=";
      fetchSubmodules = true;
      leaveDotGit = false;
      deepClone = false;
    };

    nativeBuildInputs = [ pkg-config cmake ninja ];

    buildInputs = [
      boostStatic.dev
      llvmPackages.libclang
      llvmPackages.llvm
    ];

    # Regarding the patch, it was created by me (Hydn) to fix two errors.
    # 1 - TODO: Comment on weird CMakeLists.txt config.
    # 2 - Hyde is compiled with -Werror but there was one warning about a
    # discarded return value. The patch on sources/autodetect.cpp fixes it.
    # This should probably be fixed upstream.
    patches = [ ./fix-build.patch ];

    installPhase = ''
      mkdir -p $out/bin
      mv hyde $out/bin
    '';
  }
