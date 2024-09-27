{ config, pkgs, lib, ... }:

{ 
  home.packages = with pkgs; [  
    curl
    dust
    tldr
    tailscale
    ffmpeg-full
  ];
  
  programs = {  
    fzf.enable = true;
    bat.enable = true;
    btop.enable = true;
    neovim.enable = true;

    fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
        display = {
          separator = "";
          keyWidth = 15;
        };
      };
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

