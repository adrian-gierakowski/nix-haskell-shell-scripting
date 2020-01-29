#! /usr/bin/env nix-shell
#! nix-shell -i runghc -p "ghc.withPackages (x: [ x.turtle ])"
#! nix-shell -I nixpkgs=https://github.com/nixos/nixpkgs/archive/9beb0d1ac2ebd6063efbdc4d3631f8ce137bbf90.tar.gz

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = echo "Hello Turtle!"
