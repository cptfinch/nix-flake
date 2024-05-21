{ pkgs, ... }:

pkgs.mkShell {
  buildInputs = [
    pkgs.cmake
    pkgs.gcc
    pkgs.qt5
    pkgs.libX11
    pkgs.libXtst
    pkgs.libXi
    pkgs.openssl
    pkgs.curl
    pkgs.libXinerama
  ];

  shellHook = ''
    echo "Development environment for Barrier set up."
  '';
}

