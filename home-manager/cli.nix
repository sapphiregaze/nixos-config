{ config, pkgs, ... }:

{ 
  home.packages = with pkgs; [  
    curl
    neovim
    dust
    fastfetch
    tldr
  ];
  
  programs = {  
    fzf.enable = true;
    bat.enable = true;
    btop.enable = true;
    
    starship = {  
      enable = true;
      settings = {};
    };
    
    git = {  
      enable = true;
      userName = "SapphireGaze";
      userEmail = "jasminehuang2048@outlook.com";
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
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        ll = "ls -la";
        cd = "z-and-ls";
        rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      };

      initExtra = ''
        function z-and-ls() {
          z "$@"
          ls
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

