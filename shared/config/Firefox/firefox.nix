{configs, pkgs, ...}:
	let
		makeExtension = extension: {
			install_url = "https://addons.mozilla.org/firefox/downloads/latest/${extension}/latest.xpi";
			installation_mode = "force_installed";
		};
	in
{
	programs.firefox = {
		enable = true;
		policies = {
			"DisableTelemetry" = true;
			"DisplayBookmarksToolbar" = "always";
			"EnableTrackingProtection" = {
				"Value" = true;
				"Locked" = true;
				"Cryptomining" = true;
				"Fingerprinting" = true;
			};
			"DisablePocket" = true;
			"ExtensionSettings" = {
				"*".installation_mode = "blocked";
				"queryamoid@kaply.com" = {
						install_url = "https://github.com/mkaply/queryamoid/releases/download/v0.1/query_amo_addon_id-0.1-fx.xpi";
						installation_mode = "force_installed";
					};
				"uBlock0@raymondhill.net" = makeExtension "ublock-origin";
				"{f4961478-ac79-4a18-87e9-d2fb8c0442c4}" = makeExtension "global-speed";
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = makeExtension "bitwarden-password-manager";
				"{e90f5de4-8510-4515-9f67-3b6654e1e8c2}" = makeExtension "dictionary-anyvhere";
				"{00000f2a-7cde-4f20-83ed-434fcb420d71}" = makeExtension "imagus";
				"{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = makeExtension "styl-us";
				"addon@simplelogin" = makeExtension "simplelogin";
				"sponsorBlocker@ajay.app" = makeExtension "sponsorblock";
				"deArrow@ajay.app" = makeExtension "dearrow";
				"{2662ff67-b302-4363-95f3-b050218bd72c}" = makeExtension "untrap-for-youtube";
				};
	};
		preferences = {
		"layout.spellcheckDefault" = "5";
		"alerts.showFavicons" = true;
		"browser.aboutConfig.showWarning" = false;
		};
	};
}
