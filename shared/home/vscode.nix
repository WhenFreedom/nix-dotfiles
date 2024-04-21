{pkgs, ...}:
{
	programs.vscode = {
		enable = true;
		extensions = with pkgs.vscode-extensions; [
			esbenp.prettier-vscode
			jnoortheen.nix-ide
			github.copilot
		];
	};
		}
