# shells/devShell2.nix
{ nixpkgs }:

let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  ruby = pkgs.ruby.withPackages (ps: with ps; [
    rails
    bundler
  ]);
in pkgs.mkShell {
  buildInputs = [
    ruby
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

