{ pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = pkgs.niri-unstable;
  environment.systemPackages = with pkgs; [
    quickshell
    swaybg
    kdePackages.polkit-kde-agent-1
    xwayland-satellite
    swayidle
    swaylock
    fuzzel
    alacritty

 ];
}
