let
  inherit (import ../../nix/default.nix {}) pkgs;

in
  pkgs.mkShell {
    buildInputs = [ (pkgs.ghc.withPackages (x: [ x.turtle ])) ];
  }
