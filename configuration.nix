# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";
  boot.loader.gummiboot.enable = true;

  time.timeZone = "Asia/Kolkata";
  networking.hostName = "sivas"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless.
  networking.nameservers = [ "8.8.8.8" ];
  networking.connman.enable = true;
  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    vim_configurable
    vlc
    htop
    gcc
    git
    kde4.konsole
    scrot
    bind
    chromium
    connman
    evince
    unzip
    hexchat
    haskellPackages.ghc
    haskellPackages.cabalInstall
    haskellPackages.alex
    haskellPackages.happy
    nix-repl
    rxvt_unicode
    dmenu
    xlibs.xinit
    xlibs.xrdb
    zsh
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver.desktopManager.default = "none";
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.windowManager.default = "xmonad";
  services.xserver.synaptics.enable = false;
  # services.xserver.autorun = false;
  services.xserver.displayManager.sessionCommands = ''
	xmonad
'';

  fonts = {
	enableFontConfig = true;
	enableFontDir = true;
	enableGhostscriptFonts = true;
	fonts = with pkgs; [
	  corefonts
	  dejavu_fonts
	  inconsolata
	  ubuntu_font_family
	];
  };
  
  security.sudo.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.sivan = {
    createHome = true;
    home = "/home/sivan";
    description = "Sivan Da";
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
    uid = 1000;
  };

}
