{ pkgs, ... }:

{
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    ansible
    bat
    clang-tools
    curl
    delta
    eza
    fd
    fzf
    git
    git-lfs
    glow
    htop
    jq
    just
    lazydocker
    lazygit
    neovim
    oh-my-posh
    pass
    phpantom-lsp
    pkgconf
    pyright
    ripgrep
    sqlite
    tailwindcss-language-server
    tmux
    tree-sitter
    vscode-langservers-extracted
    yazi
    zoxide
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true; # ghost text from history
    syntaxHighlighting.enable = true;

    # Only rebuild the completion dump once a day (and skip the security
    # audit) instead of on every shell launch.
    completionInit = ''
      autoload -Uz compinit
      _zdump=''${ZDOTDIR:-$HOME}/.zcompdump
      _zfresh=( $_zdump(N.mh-24) )
      if (( $#_zfresh )); then
        compinit -C -d "$_zdump"
      else
        compinit -d "$_zdump"
      fi
      unset _zdump _zfresh
    '';

    history = {
      path = "$HOME/.zsh_history";
      size = 5000;
      save = 5000;
      append = true;
      findNoDups = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      saveNoDups = true;
      share = true;
    };

    initContent = ''
      # Variables
      export EDITOR=nvim
      export GPG_TTY=$(tty)
      export HISTDUP=erase
      export LANG=en_US.UTF-8
      export LC_ALL=$LANG
      export PATH="$PATH:/etc/profiles/per-user/$USER/bin"
      export PATH="$PATH:/run/current-system/sw/bin"
      export PATH="$PATH:/opt/homebrew/bin"
      export PATH="$PATH:/opt/homebrew/sbin"
      export PATH="$PATH:/usr/local/bin"
      export PATH="$PATH:/usr/bin"
      export PATH="$PATH:/usr/sbin"
      export PATH="$PATH:/bin"
      export PATH="$PATH:/sbin"
      export VISUAL=$EDITOR

      # Options
      setopt ALWAYS_TO_END
      setopt AUTO_LIST
      setopt AUTO_MENU
      setopt AUTO_PARAM_SLASH
      setopt AUTO_PUSHD
      setopt CHASE_LINKS
      setopt COMPLETE_IN_WORD
      setopt HIST_REDUCE_BLANKS
      setopt HIST_VERIFY
      setopt LIST_AMBIGUOUS
      setopt NO_BEEP
      setopt NO_HUP
      setopt NOTIFY
      setopt PUSHD_IGNORE_DUPS
      setopt PUSHD_SILENT

      # Completion
      zmodload zsh/complist
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select=2

      # Setup Oh My Posh (prompt theme engine)
      if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
        eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.json)"
      fi

      # Make it possible to change a command in Neovim
      autoload -U edit-command-line
      zle -N edit-command-line

      # Key bindings
      bindkey -v
      bindkey '^A' beginning-of-line
      bindkey '^B' backward-word
      bindkey '^E' end-of-line
      bindkey '^F' forward-word
      bindkey '^K' kill-whole-line
      bindkey '^L' clear-screen
      bindkey '^X' edit-command-line
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history

      # Setup fzf (command-line fuzzy-finder)
      source <(fzf --zsh)
      export FZF_TMUX_OPTS="-p80%,60%"
      export FZF_DEFAULT_OPTS='--style full'
      export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude \".git\""
      export FZF_CTRL_T_OPTS="--preview 'bat --number --color=always --line-range :500 {}'"
      export FZF_CTRL_T_COMMAND="''${FZF_DEFAULT_COMMAND} --type f"
      export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
      export FZF_ALT_C_COMMAND="''${FZF_DEFAULT_COMMAND} --type d"

      _fzf_compgen_path() {
          eval "''${FZF_CTRL_T_COMMAND} . \"''${1}\""
      }

      _fzf_compgen_dir() {
          eval "''${FZF_ALT_C_COMMAND} . \"''${1}\""
      }

      # Setup Zoxide (a smarter cd command)
      if [[ -z "''${CLAUDECODE}" ]]; then
        eval "$(zoxide init zsh)"
        alias cd='z'
      fi

      # Aliases
      alias lf='ls --long --all'
      alias la='ll --all'
      alias ll='ls --long --no-permissions --no-user --no-time --no-filesize'
      alias ls='eza --color=always --icons=always --group-directories-first'
      alias vim='nvim'
    '';
  };
}
