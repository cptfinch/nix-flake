{ nixpkgs }:

nixpkgs.legacyPackages.x86_64-linux.mkShell {

  name = "pts-dev-shell";

  buildInputs = [
    nixpkgs.legacyPackages.x86_64-linux.subversion
    nixpkgs.legacyPackages.x86_64-linux.git
  ];

  shellHook = ''
    echo "pts dev env is ready to use"
  '';
}

