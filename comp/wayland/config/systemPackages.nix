{pkgs, inputs, ...}:

{
    environment.systemPackages = with pkgs; [
      vulkan-validation-layers
    ];
  }
