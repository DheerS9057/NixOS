function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
      set fish_greeting
    fish_add_path /home/dheer/Documents/Scripts
    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    #Zoxide
    zoxide init fish | source
    # UTF8 Export
    export LANG=en_IN.UTF-8

    # Aliases
    alias gtime "date +"%d/%m--%H%M""
    alias ngit "sudo git add . && sudo git commit -m "
    alias rm "safe-rm"
    alias svim 'sudo -E nvim'
    alias pamcan pacman
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    alias cd z
    alias cat bat
    alias vi nvim
    alias vim nvim 
    alias nix-switch "cd /home/$USER/nix && ngit '$(gtime)' && sudo nixos-rebuild switch --flake ~/nix#The-Machine "
    alias IUseNixBtw "fastfetch"
    alias "Windows\>\Linux" "shutdown "
    alias yta="cd Music && yt-dlp -f 'bestaudio' --audio-format flac --extract-audio"
    alias :wq exit
    alias :q exit


end
