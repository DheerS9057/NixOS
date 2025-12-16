{ pkgs, inputs, ... }:
let
  quickshellWithQt6 = pkgs.quickshell.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [
      pkgs.qt6.wrapQtAppsHook
    ];

    buildInputs = (old.buildInputs or []) ++ [
      pkgs.qt6.qtbase
      pkgs.qt6.qtmultimedia
      pkgs.qt6.qtdeclarative
      pkgs.qt6.qtsvg
      pkgs.wlsunset
      pkgs.gpu-screen-recorder
      pkgs.gpu-screen-recorder-gtk
      pkgs.wlsunset
    ];
  });
in
{
  environment.systemPackages = with pkgs; [
    quickshellWithQt6
    quickshell
    swaybg
    kdePackages.polkit-kde-agent-1
    xwayland-satellite
    pkgs.gpu-screen-recorder
    wlsunset
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    tofi
 ];
}
