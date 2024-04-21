{pkgs, inputs, ...}:
{
	environment.systemPackages = with pkgs; [
		#(import inputs.mpd-eww {inherit pkgs;})
	];
	}
