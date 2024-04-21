{pkgs, ...}:
{
	services.mpd = {
		enable = true;
		musicDirectory = "/home/diverseuniverse/Music";
		extraConfig = ''
			audio_output {
					type "pipewire"
					name "PipeWire Output"
				}
				'';
	};
}
