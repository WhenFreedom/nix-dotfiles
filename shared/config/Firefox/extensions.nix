{pkgs, ...}:
let
	makeExtension = extensionURL: {
			install_url = extensionURL;
			installation_mode = "force_installed";
		};
	extUrl = "https://addons.mozilla.org/firefox/downloads/latest/";
in
{
		"*".installation_mode = "blocked";
		"uBlock0@raymondhill.net" = makeExtension "${extUrl}/ublock-origin/latest.xpi";
		"{f4961478-ac79-4a18-87e9-d2fb8c0442c4}" = makeExtension "${extUrl}/global-speed/latest.xpi";
		"{446900e4-71c2-419f-a6a7-df9c091e268b}" = makeExtension "${extUrl}/global-speed/latest.xpi";
		"{e90f5de4-8510-4515-9f67-3b6654e1e8c2}" = makeExtension "${extUrl}/dictionary-anyvhere/latest.xpi";
		"{00000f2a-7cde-4f20-83ed-434fcb420d71}" = makeExtension "${extUrl}/imagus/latest.xpi";
		"{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = makeExtension "${extUrl}/styl-us/latest.xpi";
	}
