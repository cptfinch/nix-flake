{ nixpkgs }:

nixpkgs.legacyPackages.x86_64-linux.mkShell {
  buildInputs = [
    nixpkgs.legacyPackages.x86_64-linux.cmake
    nixpkgs.legacyPackages.x86_64-linux.gcc
    nixpkgs.legacyPackages.x86_64-linux.qt5
    nixpkgs.legacyPackages.x86_64-linux.libX11
    nixpkgs.legacyPackages.x86_64-linux.libXtst
    nixpkgs.legacyPackages.x86_64-linux.libXi
    nixpkgs.legacyPackages.x86_64-linux.openssl
    nixpkgs.legacyPackages.x86_64-linux.curl
    nixpkgs.legacyPackages.x86_64-linux.libXinerama
  ];

  shellHook = ''
    echo "Development environment for Barrier set up."
  '';
}


