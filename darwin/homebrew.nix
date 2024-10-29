{...}: {
  homebrew = {
    enable = true;

    global = {
      autoUpdate = true;
    };

    # will not be uninstalled when removed
    # ID is the app store app ID
    masApps = {
      # Xcode = 497799835;
      TestFlight = 899247664;
      WhatsApp = 310633997;
    };

    onActivation = {
      # cleanup = "zap"; # "zap" removes manually installed brews and casks
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      # default
      "homebrew/bundle"
      "homebrew/services"

      # custom
      "railwaycat/emacsmacport" # emacs-mac
      "d12frosted/emacs-plus" # emacs-plus
      "FelixKratz/formulae" # borders
      "koekeishiya/formulae" # yabai/skhd
      "nikitabobko/tap" # aerospace
    ];

    brews = [
      "sniffnet" # monitor network traffic
      "bitwarden-cli" # raycast extension does not like nix version
      "borders" # borders for windows
      "coreutils" # to help unfuck emacs
      "libtool" # xcode toolchain expects some of these from brew, not nix

      # ios development
      "cocoapods"
      "ios-deploy"
      "fastlane"

      # window management
      "yabai"
      "skhd"
      "sketchybar"

      "emacs-plus@30"

      #rails
      "ruby"
    ];

    casks = [
      # utilities
      "aldente" # battery management
      "macfuse" # file system utilities
      "hiddenbar" # hides menu bar icons
      "meetingbar" # shows upcoming meetings
      "aerospace" # tiling window manager
      "syncthing" # real-time file synchronisation software

      # coding
      "postman"
      "emacs-mac"
      "expo-orbit"

      # virtualization
      "utm" # virtual machines
      "docker" # docker desktop

      # communication
      "microsoft-teams"
      "zoom"
      "slack"
      "discord"

      # art
      "inkscape"
      "krita"

      "bitwarden" # password manager
      "spotify" # music
      "android-studio" # needed for react-native
      "zulu@17"
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
  };
}
