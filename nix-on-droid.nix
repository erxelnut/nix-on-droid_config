{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
    openssh
    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
    #_0xproto
    nerd-fonts._0xproto
    #(nerdfonts.override { fonts = [ "_0xproto" ]; }) 
    #_0xproto
  ];
  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";
  user.shell = "${lib.getExe pkgs.zsh}";
  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  terminal.font = "${pkgs.nerd-fonts._0xproto}/share/fonts/truetype/NerdFonts/0xProto/0xProtoNerdFontMono-Regular.ttf";
  
  # Set your time zone
  #time.timeZone = "Europe/Berlin";
  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}
