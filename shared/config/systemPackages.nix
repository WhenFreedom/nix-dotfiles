{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    nix-ld
    git
    nodejs
    python3
    gcc
    dunst
    home-manager
    mpd
    mpc-cli
    mpd-discord-rpc
    pulseaudio
    thunderbird
    zsh
    btop
    gh
    ranger
    utillinux
    neovim
    cargo
    rustc
    ];

  programs = {
      nix-ld.enable = true;
      zsh.enable = true;
    };
  }
