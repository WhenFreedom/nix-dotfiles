{pkgs, ...}:
{
	services.mpd-discord-rpc = {
		enable = true;
		settings = {
			id = 1203721555125870652;
			hosts = [ "localhost:6600" ];

			format = {
				details = "$title";
				state =  "$artist";
				timestamp = "left";
				};
			};
	};
}
