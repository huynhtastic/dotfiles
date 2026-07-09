{ config, pkgs, user, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # cli i use constantly
    ripgrep   # fast search
    fd        # fast find
    fzf       # fuzzy finder
    jq        # json on the command line
    lazygit
    # the font everything renders in
    nerd-fonts.hack
  ];
  fonts.fontconfig.enable = true;
  home.sessionVariables.EDITOR = "nvim";

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;      # ghost text from history
    syntaxHighlighting.enable = true;  # commands turn green when valid
    initContent = ''
      bindkey '^f' autosuggest-accept
      ENABLE_CORRECTION="true"

      # For Android Development
      export PATH="$PATH:/Users/richardhuynh/Library/Android/sdk/platform-tools"

      # For Flutter/Dart packages
      export PATH="$PATH:$HOME/.pub-cache/bin"

      # For LM Studio
      export PATH="$PATH:/Users/richardhuynh/.lmstudio/bin"

      # AGY
      export PATH="/Users/richardhuynh/.antigravity/antigravity/bin:$PATH"
      # AGY IDE
      export PATH="/Users/richardhuynh/.antigravity-ide/antigravity-ide/bin:$PATH"
      # AGY CLI
      export PATH="/Users/richardhuynh/.local/bin:$PATH"

      # pnpm Path Setup
      case ":$PATH:" in
        *":$PNPM_HOME/bin:"*) ;;
        *) export PATH="$PNPM_HOME/bin:$PATH" ;;
      esac

      # Google Cloud SDK Scripts
      if [ -f '/Users/richardhuynh/Downloads/google-cloud-sdk/path.zsh.inc' ]; then 
        source '/Users/richardhuynh/Downloads/google-cloud-sdk/path.zsh.inc'
      fi

      if [ -f '/Users/richardhuynh/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then 
        source '/Users/richardhuynh/Downloads/google-cloud-sdk/completion.zsh.inc'
      fi

      # Dart CLI Completion Script
      if [[ -f /Users/richardhuynh/.dart-cli-completion/zsh-config.zsh ]]; then
        source /Users/richardhuynh/.dart-cli-completion/zsh-config.zsh
      fi
    '';
    shellAliases = {
      "nv" = "nvim";
      ".." = "cd ..";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
      cmd_duration.format = "[$duration]($style) ";
    };
  };

  # Edit-in-place: the real file stays in my repo, ~/.config just points at it.
  home.file.".config/ghostty".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/ghostty";
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
  home.file.".config/herdr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr";

  # Agent Files
  home.file.".config/opencode/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".gemini/GEMINI.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
}
