with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    ansible
    ansible-lint
    google-cloud-sdk
    python38Packages.docker-py
    python38Packages.google_auth
    python38Packages.requests
  ];
}
