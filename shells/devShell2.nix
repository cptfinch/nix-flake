# shells/devShell2.nix
{ nixpkgs }:

let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
in pkgs.mkShell {
  buildInputs = [
    pkgs.ruby
    pkgs.rubyPackages.rails
    pkgs.rubyPackages.bundler
    pkgs.nodejs
    pkgs.yarn
    pkgs.postgresql
    pkgs.libpq
    pkgs.zlib
    pkgs.openssl
    pkgs.gnumake
    pkgs.gcc
    pkgs.gdbm
    pkgs.sqlite
  ];

  shellHook = ''
    export PATH=$PATH:${pkgs.rubyPackages.bundler}/bin:${pkgs.ruby}/bin
    echo "Welcome to the Ruby on Rails development shell!"
  '';
}

