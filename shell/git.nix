{...}: {
  programs.git = {
    enable = true;
    delta.enable = true;
    userName = "Brandon Wetzel";
    userEmail = "mauzybwy@gmail.com";
    signing = {
      key = null; # gnupg decides by mail
      signByDefault = false;
    };
    #hooks = {prepare-commit-msg = ./rtl-hook.sh;};
    aliases = {
      cm = "commit";
      ca = "commit --amend";
      co = "checkout";
      cp = "cherry-pick";

      di = "diff";
      dh = "diff HEAD";

      pu = "pull";
      ps = "push";
      pf = "push --force-with-lease";

      st = "status -sb";
      fe = "fetch --all";
      gr = "grep -in";

      r = "rebase";
      ri = "rebase -i";
      rc = "rebase --continue";
    };
    ignores = [
      # ide
      ".idea"
      ".vs"
      ".vsc"
      ".vscode"

      # npm
      "node_modules"
      "npm-debug.log"

      # python
      "__pycache__"
      "*.pyc"

      ".ipynb_checkpoints" # jupyter
      "__sapper__" # svelte
      ".DS_Store" # mac
      "kls_database.db" # kotlin lsp
    ];

    extraConfig = {
      init.defaultBranch = "main";
      pull = {
        ff = false;
        commit = false;
        rebase = true;
      };
      fetch = {prune = true;};
      push.autoSetupRemote = true;
      delta = {line-numbers = true;};
    };
  };
}
