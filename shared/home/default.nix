{config, lib, pkgs, ...}:
{
		imports = [
		./zsh
		./kitty.nix
		./mpd
		./vscode.nix
		./nvim
		./emacs.nix
		./firefox.nix
		];

		xdg.configFile = {
			 "neofetch".source = ./neofetch;
			};
		home.stateVersion = "23.11";
	}
