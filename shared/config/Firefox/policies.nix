{pkgs, config, ...}:
let
	extensions = import ./extensions.nix;
in
{
	policies = {
		DisableTelemetry = true;
		"DisplayBookmarksToolbar" = "always";
		"EnableTrackingProtection" = {
				"Value" = true;
				"Locked" = true;
				"Cryptomining" = true;
				"Fingerprinting" = true;
			};
		"DisablePocket" = true;
	};
}
