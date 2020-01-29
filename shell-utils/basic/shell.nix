let
  inherit (import ../../nix/default.nix {}) pkgs shell;

in
  with pkgs; mkShell {
    buildInputs = [
      (ghc.withPackages (x: [ x.turtle ]))
      cabal-install
      cabal2nix
    ];
  }
