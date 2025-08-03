{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs =
    let
      python-env = pkgs.python3.withPackages (p: [ p.google-auth ]);
    in
    with pkgs; [
      ansible
      ansible-lint
      google-cloud-sdk
      python-env
    ];
}
