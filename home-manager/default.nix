{pkgs, ...}: {
  imports = [
    ./git.nix
    # ./zsh.nix
  ];

  programs = import ./programs.nix {inherit pkgs;};
  home = {
    packages = import ./packages/default.nix {inherit pkgs;};

    shellAliases = {
      # nix
      renix = "darwin-rebuild switch --flake ~/.nixpkgs";

      # builtins
      size = "du -sh";
      cp = "cp -i";
      mkdir = "mkdir -p";
      df = "df -h";
      free = "free -h";
      du = "du -sh";
      del = "rm -rf";
      lst = "ls --tree -I .git";
      lsl = "ls -l";
      lsa = "ls -a";
      null = "/dev/null";

      # overrides
      cat = "bat";
      top = "btop";
      htop = "btop";
      ping = "gping";
      diff = "delta";
      ssh = "TERM=screen ssh";
      python = "python3";
      pip = "python3 -m pip";
      venv = "python3 -m venv";
      j = "z";
      ji = "zi";

      # programs
      e = "emacsclient";
      g = "git";
      k = "kubectl";
      d = "docker";
      kca = "kubectl apply -f";
      dc = "docker-compose";
      poe = "poetry";
      tf = "terraform";
      nr = "npm run";
      py = "python";
      pu = "pulumi";
      cht = "cht.sh"; # terminal cheat sheet
    };

    sessionPath = [
      "$HOME/go/bin"
      "$HOME/.local/bin"
      "$HOME/.local/script"
      "$HOME/.cargo/bin"
      "$HOME/.krew/bin"
      "$HOME/.mix/escripts"
    ];

    sessionVariables = {
      GO111MODULE = "on";
      EDITOR = "emacsclient";
      VISUAL = "emacsclient";
      NIXPKGS_ALLOW_UNFREE = "1";
      PULUMI_CONFIG_PASSPHRASE = "";
    };
  };
}
