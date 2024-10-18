{ config, pkgs, lib, ... }:

{ 
  home.packages = with pkgs; [  
    curl
    dust
    tldr
    tailscale
    ffmpeg-full
    termusic
    yt-dlp
  ];
  
  programs = {  
    fzf.enable = true;
    bat.enable = true;
    btop.enable = true;
    neovim.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      # export_function needed for per directory function/alias with direnv: https://github.com/direnv/direnv/issues/73
      stdlib = ''
        export_function() {
          local name=$1
          local alias_dir=$PWD/.direnv/aliases
          mkdir -p "$alias_dir"
          PATH_add "$alias_dir"
          local target="$alias_dir/$name"
          if declare -f "$name" >/dev/null; then
            echo "#!$SHELL" > "$target"
            declare -f "$name" >> "$target" 2>/dev/null
            # notice that we add shell variables to the function trigger.
            echo "$name \$*" >> "$target"
            chmod +x "$target"
          fi
        }
      '';
      nix-direnv.enable = true;
    };

    fastfetch = {
      enable = true;
      settings = { };
    };
    
    starship = {  
      enable = true;
      settings = { };
    };
    
    git = {  
      enable = true;
      userName = "SapphireGaze";
      userEmail = "jasminehuang2048@outlook.com";
    };

    eza = {
      enable = true;
      icons = true;
      enableZshIntegration = true;
      extraOptions = [
        "--group-directories-first"
      ];
    };
    
    zoxide = {  
      enable = true;
      enableZshIntegration = true;
    };
    
    zsh = {        
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;

      shellAliases = {
        ls = "eza --color=auto";
        grep = "grep --color=auto";
        ll = "eza -la --header --git";
        lt = "eza --tree";
        cd = "z-and-eza";
        open = "xdg-open";
        rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      };

      initExtra = ''
        function z-and-eza() {
          z "$@"
          eza --icons --group-directories-first
        }

        fastfetch
      '';

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };
    };
  };
}

