{pkgs, ...}:
{
	programs.zsh = {
		enable = true;
		shellAliases = {
				update = "sudo nixos-rebuild switch";
				nixConf = "cd /etc/nixos; sudo -E -s nvim /etc/nixos/configuration.nix";
				nvimS = "sudo -E -s nvim $1";
		};

		plugins = [ 
			{
				name = "zsh-autosuggestions";
				src = pkgs.fetchFromGitHub {
					owner = "zsh-users";
					repo = "zsh-autosuggestions";
					rev = "v0.7.0";
					sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
				};
			}
		];
		oh-my-zsh = {
				enable = true;
				plugins = [ "sudo" ];
			};
		localVariables = {
				ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=red";
			};

		initExtra = ''
			source /etc/nixos/shared/home/zsh/theme.zsh

			export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')

			export NIXPKGS_ALLOW_UNFREE=1

			export XDG_RUNTIME_DIR=/run/user/$(id -u)
	'';
	};
}

