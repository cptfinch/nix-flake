# shells/devShell1.nix
{ nixpkgs, self }:

nixpkgs.legacyPackages.x86_64-linux.mkShell {
  buildInputs = [
    nixpkgs.legacyPackages.x86_64-linux.cowsay
    nixpkgs.legacyPackages.x86_64-linux.hello
    nixpkgs.legacyPackages.x86_64-linux.git
    self.packages.x86_64-linux.myHello
  ];

  shellHook = ''
    echo "Welcome to devShell1!"
  '';
}

