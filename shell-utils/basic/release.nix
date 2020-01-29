let
  inherit (import ../../nix/default.nix {}) pkgs;

in
  pkgs.haskellPackages.callPackage ./default.nix {}