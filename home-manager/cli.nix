{ config, pkgs, ... }:

{ 
  home.packages = with pkgs; [  
    curl
    neovim
    dust
    fastfetch
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
      userEmail = "sapphiregaze@sapphiregaze.dev";
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

      shellAliases = {
        ll = "ls -la";
      };

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      oh-my-zsh = {
        enable = true;
	plugins = [ 
	  "git" 
	  "zsh-autosuggestions"
	];
      };
    };
  };
}

