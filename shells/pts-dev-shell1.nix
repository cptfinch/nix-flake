{ nixpkgs }:

nixpkgs.legacyPackages.x86_64-linux.mkShell {

  name = "pts-dev-shell";

  buildInputs = [
    nixpkgs.legacyPackages.x86_64-linux.subversion
    nixpkgs.legacyPackages.x86_64-linux.git
    nixpkgs.legacyPackages.x86_64-linux.coreutils 
    nixpkgs.legacyPackages.x86_64-linux.shadow 
    nixpkgs.legacyPackages.x86_64-linux.util-linux   
];

#  shellHook = ''
#    # Create a chroot environment
#    CHROOT_DIR=/tmp/nix-chroot
#    mkdir -p $CHROOT_DIR/tcs_usr/ccadmin
#
#    # Mount necessary filesystems
#    sudo mount --bind /dev $CHROOT_DIR/dev
#    sudo mount --bind /proc $CHROOT_DIR/proc
#    sudo mount --bind /sys $CHROOT_DIR/sys
#
#    # Create the user in the chroot environment
#    sudo chroot $CHROOT_DIR /bin/bash -c "
#      if ! id -u ccadmin >/dev/null 2>&1; then
#        useradd -m -d /tcs_usr/ccadmin -s /bin/bash ccadmin
#        echo 'ccadmin:password' | chpasswd
#      fi
#    "
#
#    # Switch to the chroot environment as ccadmin
#    sudo chroot --userspec=ccadmin:ccadmin $CHROOT_DIR /bin/bash
#  '';
}

