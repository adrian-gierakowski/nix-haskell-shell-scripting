#!/bin/sh
set -o nounset
set -o errexit

# This file install the only dependencies which need to be installed globally
# on your system. Theoretically you only need nix (and nix-shell), but lorri
# and direnv make development experience smoother by automatically loading
# environment defined in .envrc/shell.nix and allowing you to work in your
# current shell.

echo_err () { echo >&2 "${@:-}"; }

check_command () {
  command=$1
  echo_err "Checking command: $command"
  command -v $command >/dev/null 2>&1 || {
    echo_err "   not available."
    return false
  }
  echo_err "   available!"
}

check_command nix || {
  echo_err "installing..."
  curl https://nixos.org/nix/install | sh
  echo_err
  echo_err "nix installed!"
}

check_command lorri || {
  echo_err "installing..."
  echo_err "this might take a while, in the meantime you can check out the docs at: https://github.com/target/lorri"
  nix-env -if https://github.com/target/lorri/archive/master.tar.gz
  echo_err
  echo_err "lorri installed!"
}

check_command direnv || {
  echo_err "installing..."
  nix-env -i direnv
  echo_err
  echo_err "direnv installed!"
}

echo_err
echo_err "All tools installed!"
echo_err
echo_err "To hook direnv to your shell follow instructions here: https://direnv.net/docs/hook.html"