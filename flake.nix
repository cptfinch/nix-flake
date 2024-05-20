{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = {
      # Existing package from nixpkgs
      hello = nixpkgs.legacyPackages.x86_64-linux.hello;


     # Custom package
      myHello = import ./myHello.nix {
        stdenv = nixpkgs.legacyPackages.x86_64-linux.stdenv;
      };

      # Another package: cowsay
      cowsay = nixpkgs.legacyPackages.x86_64-linux.cowsay;

      default = self.packages.x86_64-linux.myHello;
    };

    devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [
        self.packages.x86_64-linux.myHello  # Include custom package in devShell
        nixpkgs.legacyPackages.x86_64-linux.hello  # Add the hello package to the devShell
        nixpkgs.legacyPackages.x86_64-linux.cowsay  # Add the cowsay package to the devShell
      ];

      shellHook = ''
        echo "Welcome to the development shell!";
      '';
    };
  };
}


