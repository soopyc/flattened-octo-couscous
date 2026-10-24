with import <nixpkgs> {
  config = {};
  overlays = [];
};

mkShellNoCC {
  packages = [
    docker-compose
    mkcert
  ];
}
