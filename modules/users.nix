 { pkgs, ...}:
{
 users.users.dheer = {
    isNormalUser = true;
    description = "Dheer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    ];
  };
  users.defaultUserShell = pkgs.fish;
}

