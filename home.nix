{config, lib, pkgs, ... }:

{
  # Read the changelog before changing this value
  home.stateVersion = "24.05";
  home.packages = with pkgs;[
	neovim
	neofetch
        htop
        curl
	zsh
	zsh-completions
	zsh-powerlevel10k
	ffmpeg
	tree
	eza
	tenere
        cmatrix
	#browsh
	w3m
	#alacritty
	tmux
	
  ];
  #comment out this part to use stylix
  #fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  # insert home-manager config
  programs.zoxide.enable = true;
  programs.yazi = {
	enable = true;
  };
  programs.git = {
	enable = true;
	userEmail = "test@gmail.com";
	userName = "opusdelu24";
  };
  programs.zsh = {
  	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	dotDir = ".config/zsh";
	oh-my-zsh = {
	  enable = true;
	};
	initContent = ''
	  source ~/.config/zsh/highlight-colors.zsh
    	  source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
	  [[ -f ~/.config/zsh/.p10k.zsh ]] && source ~/.config/zsh/.p10k.zsh 
	'';
	shellAliases = {
	  ll = "ls -la";
	  gs = "git status";
	};
    };

 
}

