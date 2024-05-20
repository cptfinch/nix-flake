# myHello.nix
{ stdenv }:

stdenv.mkDerivation {
  pname = "myHello";
  version = "1.0.0";
  src = ./.;
  buildInputs = [ ];
  installPhase = ''
    mkdir -p $out/bin
    echo '#!/bin/sh' > $out/bin/myHello
    echo 'echo Hello, Nix Flakes!' >> $out/bin/myHello
    chmod +x $out/bin/myHello
  '';
}

