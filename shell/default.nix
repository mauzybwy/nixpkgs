{pkgs, ...}: {
  imports = [
    ./git.nix
  ];

  home = {
    packages = with pkgs; [
      #neovim # customized by overlay

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

      grc # colored log output
      gitAndTools.delta # pretty diff tool
      sshfs # mount folders via ssh
      gh # github cli tool
      cht-sh # cheat sheet -> cht python read file
      hyperfine # benchmark tool
      ffmpeg # video editing and cutting
      rclone # sync files
      duf # disk usage
      yq-go # yaml, toml parser
      ytt # yaml templating engine
      diskonaut # explore disk size
      gnupg # gpg
      gping # ping with a graph
      corepack # node wrappers
      presenterm # presentation tool
      comma # run nix binaries on demand

      # gnu binaries
      coreutils-full # multiple tools
      gnutar
      gnused
      gnugrep
      gnumake
      gzip
      findutils
      gawk

      # cloud
      google-cloud-sdk
      awscli2
      s3cmd

      # programming

      ## nix
      alejandra

      ## emacs
      emacs-lsp-booster

      ## python
      python3
      poetry # python tools
      rustup # rust

      ## node
      deno # node runtime
      nodejs
      nodePackages.npm
      nodePackages.yarn
      nodePackages.pnpm
      nodePackages.expo-cli
    ];

    shellAliases = {
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
      "$HOME/.cargo/bin"
      "$HOME/.krew/bin"
    ];

    sessionVariables = {
      GO111MODULE = "on";
      EDITOR = "emacsclient";
      VISUAL = "emacsclient";
      NIXPKGS_ALLOW_UNFREE = "1";
      PULUMI_CONFIG_PASSPHRASE = "";
    };
  };

  programs = {
    # let home-manager manage itself
    home-manager.enable = true;

    # shell integrations are enabled by default
    zoxide.enable = true; # autojump
    jq.enable = true; # json parser
    bat.enable = true; # pretty cat
    lazygit.enable = true; # git tui
    nnn.enable = true; # file browser
    btop.enable = true; # htop alternative
    nushell.enable = true; # zsh alternative
    broot.enable = true; # browser big folders
    eza.enable = true;

    # sqlite browser history
    atuin = {
      enable = true;
      flags = ["--disable-up-arrow"];
      settings = {
        inline_height = 20;
        style = "compact";
      };
    };

    # # pretty prompt
    # starship = {
    #   enable = true;
    #   settings = {
    #     add_newline = false;
    #     character = {
    #       success_symbol = "[➜](bold green)";
    #       error_symbol = "[✗](bold red)";
    #     };
    #   };
    # };

    # pretty ls
    lsd = {
      enable = true;
      enableAliases = true;
    };

    go = {
      enable = true;
      package = pkgs.go_1_22;
      goPath = "go";
      goBin = "go/bin";
      goPrivate = [];
    };

    htop = {
      enable = true;
      settings = {
        tree_view = true;
        show_cpu_frequency = true;
        show_cpu_usage = true;
        show_program_path = false;
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor --exclude node_modules";
      defaultOptions = [
        "--border sharp"
        "--inline-info"
      ];
    };

    # snippet manager
    pet = {
      enable = true;
      # <param=default-value> -> use variables
      snippets = [
        {
          command = "git rev-parse --short HEAD";
          description = "show short git rev";
          output = "888c0f8";
          tag = ["git"];
        }
        {
          description = "show size of a folder";
          command = "du -hs <folder>";
        }
        {
          description = "garden kubeconfig from ske-ci ondemand cluster";
          command = "kubectl get secret garden-kubeconfig-for-admin -n garden -o jsonpath='{.data.kubeconfig}' | base64 -d > garden-kubeconfig-for-admin.yaml";
        }
        {
          description = "get all images used in a kubernetes cluster";
          command = "kubectl get pods --all-namespaces -o jsonpath=\"{.items[*].spec['initContainers', 'containers'][*].image}\" | tr -s '[[:space:]]' '\n' | sort | uniq -c";
        }
      ];
    };
  };
}
