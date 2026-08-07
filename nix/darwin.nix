{ config, username, ... }:

{
  nix.enable = false;
  system.stateVersion = 6;
  system.primaryUser = username;

  system.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";
    trackpad.TrackpadRightClick = true;
    CustomUserPreferences = {
      "com.apple.AppleMultitouchTrackpad".TrackpadCornerSecondaryClick = 2;
      "com.apple.driver.AppleBluetoothMultitouch.trackpad".TrackpadCornerSecondaryClick = 2;
    };
  };

  users.users.${username}.home = "/Users/${username}";
  programs.zsh.enable = true;

  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    taps = builtins.attrNames config.nix-homebrew.taps;

    brews = [
      "coderabbitai/tap/git-gtr"
      "gnupg"
      "hunk"
      "mariadb"
      "pinentry-mac"
      "redis"
    ];

    casks = [
      "boost-note"
      "claude-code"
      "docker-desktop"
      "dropbox"
      "figma"
      "firefox"
      "flux-app"
      "font-caskaydia-cove-nerd-font"
      "fork"
      "ghostty"
      "google-chrome"
      "keeweb"
      "microsoft-outlook"
      "microsoft-teams"
      "postman"
      "phpstorm"
      "raycast"
      "sequel-ace"
      "slack"
      "spotify"
      "sublime-text"
      "telegram"
      "transmit"
      "unifi-identity-endpoint"
      "visual-studio-code"
      "vlc"
      "webtorrent"
      "whatsapp"
    ];
  };
}
