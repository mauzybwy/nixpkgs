{...}: {
  homebrew = {
    enable = true;

    global = {
      autoUpdate = true;
    };

    # will not be uninstalled when removed
    # ID is the app store app ID
    masApps = {
      Xcode = 497799835;
    };

    onActivation = {
      # cleanup = "zap"; # "zap" removes manually installed brews and casks
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "sniffnet" # monitor network traffic
      "bitwarden-cli" # raycast extension does not like nix version
      "borders" # borders for windows

      # ios development
      "cocoapods"
      "ios-deploy"
      "yabai"
      "skhd"
    ];
    casks = [
      # utilities
      "aldente" # battery management
      "macfuse" # file system utilities
      "hiddenbar" # hides menu bar icons
      "meetingbar" # shows upcoming meetings
      "aerospace" # tiling window manager

      # coding
      "postman"
      "emacs-mac"

      # virtualization
      "utm" # virtual machines
      "docker" # docker desktop

      # communication
      "microsoft-teams"
      "zoom"
      "slack"
      "discord"

      "bitwarden" # password manager
      "spotify" # music
      "android-studio" # needed for react-native
      "obs" # stream / recoding software
      "readdle-spark"
      "shottr" # screenshot tool
      "the-unarchiver"
      "wireshark" # network sniffer
      "sf-symbols" # patched font for sketchybar
      "font-hack-nerd-font"
      "raycast" # launcher on steroids
      "arc" # mac browser
      "vlc" # media player
      "linear-linear" # task management
      "balenaetcher" # usb flashing
    ];
    taps = [
      # default
      "homebrew/bundle"
      "homebrew/services"

      # custom
      "railwaycat/emacsmacport" # emacs-mac
      "FelixKratz/formulae" # borders
      "koekeishiya/formulae" # yabai/skhd
      "nikitabobko/tap" # aerospace
    ];
  };
}
