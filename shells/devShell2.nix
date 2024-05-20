# shells/devShell2.nix
{ nixpkgs }:

nixpkgs.legacyPackages.x86_64-linux.mkShell {
  buildInputs = [
    nixpkgs.legacyPackages.x86_64-linux.ruby
    nixpkgs.legacyPackages.x86_64-linux.rubyPackages.rails
    nixpkgs.legacyPackages.x86_64-linux.rubyPackages.bundler
    nixpkgs.legacyPackages.x86_64-linux.nodejs
    nixpkgs.legacyPackages.x86_64-linux.yarn
    nixpkgs.legacyPackages.x86_64-linux.postgresql
    nixpkgs.legacyPackages.x86_64-linux.libpq
    nixpkgs.legacyPackages.x86_64-linux.zlib
    nixpkgs.legacyPackages.x86_64-linux.openssl
    nixpkgs.legacyPackages.x86_64-linux.gnumake
    nixpkgs.legacyPackages.x86_64-linux.gcc
    nixpkgs.legacyPackages.x86_64-linux.gdbm
    nixpkgs.legacyPackages.x86_64-linux.sqlite
  ];

  shellHook = ''
    export PATH=$PATH:${nixpkgs.legacyPackages.x86_64-linux.rubyPackages.bundler}/bin:${nixpkgs.legacyPackages.x86_64-linux.ruby}/bin
    echo "Welcome to the Ruby on Rails development shell!"
  '';
}

