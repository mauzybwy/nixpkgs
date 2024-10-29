{pkgs}:
with pkgs; [
  (import ./python-packages.nix {pkgs = pkgs;})

  # net tools
  bind
  nmap
  inetutils

  # core
  openssl
  wget
  curl
  fd
  ripgrep # fast search

  eternal-terminal # ssh, but FOREVER
  grc # colored log output
  gitAndTools.delta # pretty diff tool
  sshfs # mount folders via ssh
  gh # github cli tool
  cht-sh # cheat sheet -> cht python read file
  hyperfine # benchmark tool
  ffmpeg # video editing and cutting
  rclone # sync files
  duf # disk usage
  duc # disk usage
  yq-go # yaml, toml parser
  ytt # yaml templating engine
  diskonaut # explore disk size
  gnupg # gpg
  gping # ping with a graph
  corepack # node wrappers
  presenterm # presentation tool
  comma # run nix binaries on demand
  postgresql # PostgreSQL

  # gnu binaries
  # coreutils-full # multiple tools
  gnutar
  gnused
  gnugrep
  gnumake
  gzip
  findutils
  gawk
  stow

  cmake

  # cloud
  google-cloud-sdk
  awscli2
  s3cmd

  # programming

  watchman

  ## nix
  alejandra

  ## emacs
  emacs-lsp-booster

  ## python
  # python3
  poetry # python tools

  ## rust
  rustup

  # sql
  sqlfluff

  ## node
  deno # node runtime
  # nodejs
  # nodePackages.npm
  # nodePackages.yarn
  # nodePackages.pnpm
  # nodePackages.expo-cli
]
