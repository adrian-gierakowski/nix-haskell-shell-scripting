{ mkDerivation, base, stdenv, turtle }:
mkDerivation {
  pname = "basic";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base turtle ];
  license = stdenv.lib.licenses.bsd3;
}
