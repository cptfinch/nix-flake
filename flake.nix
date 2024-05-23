{
  description = "My personal flake with custom packages and development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = {
      # Custom package imports
      myHello = import ./packages/myHello.nix {
        stdenv = nixpkgs.legacyPackages.x86_64-linux.stdenv;
      };
      # Reference to an existing package in nixpkgs
      hello = nixpkgs.legacyPackages.x86_64-linux.hello;
      cowsay = nixpkgs.legacyPackages.x86_64-linux.cowsay;
    };

    devShells.x86_64-linux = {
      devShell1 = import ./shells/devShell1.nix { inherit nixpkgs self; };
      devShell2 = import ./shells/devShell2.nix { inherit nixpkgs; };
      barrier-dev-shell = import ./shells/barrier-dev-shell.nix { inherit nixpkgs; };
      pts-dev-shell1 = import ./shells/pts-dev-shell1.nix { inherit nixpkgs; };
    };
  };
}


