function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # No greeting
    set fish_greeting

    # ✅ Append custom scripts AFTER system paths
    fish_add_path --append ~/.local/bin

    # Starship
    starship init fish | source

    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Zoxide
    zoxide init fish | source

    # Locale
    set -x LANG en_IN.UTF-8

    # Aliases
    alias gtime "date +'%d/%m--%H%M'"
    alias ngit "sudo git add . && sudo git commit -m"
    alias rm "safe-rm"
    alias svim "sudo -E nvim"
    alias pamcan pacman
    alias ls "eza --icons"
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q "qs -c ii"
    alias cd z
    alias cat bat
    alias vi nvim
    alias vim nvim
    alias nix-switch "cd /home/$USER/nix && ngit '$(gtime)' && sudo nixos-rebuild switch --flake ~/nix#The-Machine"
    alias yta "cd Music && yt-dlp -f bestaudio --audio-format flac --extract-audio"
    alias :wq exit
    alias :q exit
    alias tree "eza --tree"
    alias top btop
    alias man batman
    alias c clear
    alias h history
    alias py python

end

