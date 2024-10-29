{pkgs, ...}: {
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

  # zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autocd = true;
  #   autosuggestion.enable = true;
  #   dotDir = ".config/zsh";

  #   history = {
  #     expireDuplicatesFirst = true;
  #     ignoreDups = true;
  #     ignoreSpace = true; # ignore commands starting with a space
  #     save = 20000;
  #     size = 20000;
  #     share = true;
  #   };

  #   initExtra = ''
  #     eval "$(/opt/homebrew/bin/brew shellenv)"
  #   '';
  # };

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

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
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
}
