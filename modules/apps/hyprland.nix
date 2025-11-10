{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      power-profiles-daemon
      hyprland
      hypridle
      hyprpaper
      hyprlock
      hyprshot
      hyprsunset
      hyprpolkitagent
      foot
      dunst
      zoxide
      waybar
      rofi
      fish
      wlogout
      wl-clipboard
      starship
      kitty
      powertop

  ];
}
