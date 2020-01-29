#! /usr/bin/env nix-shell
#! nix-shell ../shell.nix -i runghc

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = echo "Hello Turtle!"
