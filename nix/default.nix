{ sources ? import ./sources.nix }:
let
  pkgsSrc = builtins.fetchTarball { inherit (sources.nixpkgs) url sha256; };
  overlays = [
    (
      self: supper: {
        # Use niv version defined in sources.json
        inherit (import sources.niv { pkgs = supper; }) niv;
      }
    )
  ];
  pkgs = import sources.nixpkgs { inherit overlays; };

in
  {
    inherit pkgs pkgsSrc;

    shell = with pkgs; mkShell {
      buildInputs = [
        cabal-install
        cabal2nix
        ghc
        niv
      ];
    };
  }
