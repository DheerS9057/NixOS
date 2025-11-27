# NIXOS CONFIG
Just clone this repo in home directory and use 
```
sudo nixos-rebuild switch --flake ~/nix#The-Machine 
```

Using Stow instead of Home-manger for simplicity
afterwards to update the config , just use 
```
nix-switch
```
, it will cd in to ~/nix , commit to git with the tag of time and date 

![alt text](dots/images/image1.png)
![alt text](dots/images/image2.png)
