if status is-login
    switch (tty)
        case /dev/tty1
            exec mango
    end
end

set -x fish_greeting
set -x EDITOR nvim

# Zoxide
eval "$(zoxide init fish)"
alias cd z

# Starship
source (/usr/sbin/starship init fish --print-full-init | psub)

# Eza
alias ls 'eza --icons --group-directories-first'
alias l 'ls -lAh'
alias ll 'ls -l'
alias la 'ls -A'
alias lla 'ls -lA'
alias lt 'ls -T'

# Shortcuts
alias q exit
alias quit exit
alias c clear
alias cls 'clear && fastfetch'
alias dir ls
alias rl 'exec fish'
alias reload 'exec fish'

alias f fzf
alias ff fastfetch
alias oc opencode
alias t tmux
alias ze zeditor
alias zed zeditor
alias v nvim
alias vi nvim
alias vim nvim
alias pt pastel

alias b 'bat -Pp'
alias tch touch
alias mk touch
alias mkd mkdir

# Dotfiles
alias dot 'cd $HOME/.dotfiles'
alias ldot 'cd $HOME/.dotfiles && lazygit && cd -'
alias dotsync 'stow --adopt --no-folding -d $HOME/.dotfiles -t $HOME yuri'
alias zedot 'zed $HOME/.dotfiles'
alias vdot 'v $HOME/.dotfiles'

# Git
alias lg lazygit
alias g git
alias ga 'git add'
alias gp 'git push'
alias gl 'git pull'
alias gb 'git branch'
alias gc 'git checkout'
alias gcl 'git clone'
alias gm 'git merge'
alias gd 'git diff'
alias gst 'git status'
alias gcm 'git commit -m'

# System
alias df 'df -h'
alias du 'du -ch'
alias grep 'grep --color auto'
alias mkdir 'mkdir -pv'
alias free 'free -h'

# Safety
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

# Aliases
alias pacman 'sudo pacman'
alias pamac paru
alias yay paru

alias superuserdo sudo
alias please sudo
alias doas sudo
alias pls sudo

alias rg 'rg --color=always'
alias grep 'grep --color=auto'

# Abbreviations
abbr --add ... 'z ../..'
abbr --add .... 'z ../../..'
abbr --add ..... 'z ../../../..'
abbr --add ...... 'z ../../../../..'
abbr --add ....... 'z ../../../../../..'
abbr --add ........ 'z ../../../../../../..'

# System maintenance
abbr --add updmirror 'sudo reflector --country Thailand,Singapore --latest 10 --sort rate --save /etc/pacman.d/mirrorlist && paru -Syy'
abbr --add clnlog 'sudo journalctl --vacuum-time=7d'
abbr --add lpkg 'paru -Q | fzf -e'
abbr --add lupkg 'paru -Qet | fzf -e'
abbr --add clnpkg 'paru -Rns (paru -Qtdq)'
abbr --add rmpkg 'paru -Rns (paru -Qetq | fzf -e -m)'

abbr --add clnt 'gio trash --empty'
abbr --add def 'find . -type f -empty -delete'
abbr --add ded 'find . -type d -empty -delete'
abbr --add dbl 'find . -xtype l -delete'

abbr --add fef 'find . -type f -empty'
abbr --add fed 'find . -type d -empty'
abbr --add fbl 'find . -xtype l'

# Path
fish_add_path \
    $HOME/.spicetify \
    $HOME/.local/bin
