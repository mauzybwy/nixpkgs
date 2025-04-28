{pkgs, ...}: {
  imports = [
    ./homebrew.nix
    # ./skhd.nix
    # ./yabai.nix
  ];

  environment = {
    variables = {
      EDITOR = "emacsclient";
      VISUAL = "emacsclient";
      # NOTE: this doesn't work :( -
      # HOMEBREW_EMACS_PLUS_30_REVISION = "b963aae395e900c4fa3d864c030b01cf782f71c0";
    };
    systemPath = [
      "/opt/homebrew/bin" # Just put the whole thing in our path
    ];
  };

  programs = {
    zsh.enable = true;
  };

  services = {
    nix-daemon.enable = true;
    skhd.enable = true;
    sketchybar = {
      enable = true;
      extraPackages = [
        pkgs.jq
      ];
    };
  };

  networking = {
    knownNetworkServices = [
      "Wi-Fi"
    ];
    dns = [
      "9.9.9.9"
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })
      sketchybar-app-font
    ];
  };

  security = {
    pam.enableSudoTouchIdAuth = true;
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;
      spaces.spans-displays = false;
      universalaccess = {
        # FIXME: cannot write universal access
        #reduceMotion = true;
        #reduceTransparency = true;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "left";
        dashboard-in-overlay = true;
        largesize = 30;
        tilesize = 50;
        magnification = true;
        launchanim = false;
        mru-spaces = false;
        show-recents = false;
        show-process-indicators = false;
        static-only = true;
        expose-group-by-app = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf"; # current folder
        QuitMenuItem = true;
      };

      NSGlobalDomain = {
        _HIHideMenuBar = true;
        AppleFontSmoothing = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 10;
        KeyRepeat = 2;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowResizeTime = 0.0;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.trackpad.scaling" = 2.0;
      };
    };
  };
}
