# TTY auto login
if status is-login
    switch (tty)
        case /dev/tty1
            exec mango
    end
end

# Environment variables
set -x fish_greeting
set -x EDITOR nvim

# Zoxide
eval "$(zoxide init fish)"
alias cd z

# Starship
source (/usr/sbin/starship init fish --print-full-init | psub)

# Eza
alias ls 'eza -h  --icons --group-directories-first'
alias la 'ls -A'
alias l 'ls -lA'
alias ll 'ls -l'
alias lls 'ls -lA --total-size'
alias lt 'ls -T'
alias lat 'ls -TA'

# Shortcuts
alias q exit
alias quit exit

alias c clear
alias cls 'clear && fastfetch'

alias rl 'exec fish'
alias reload 'exec fish'

alias b 'bat -Pp'
alias sl 'sl -e'
alias clock "date +%H:%M:%S"

# Programs
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

# Aliases
alias pacman 'sudo pacman'
alias pamac paru
alias yay paru
alias dir ls

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

# Sudo
alias superuserdo sudo
alias bypass sudo
alias doas sudo

alias look_here_you_little_shsh sudo
alias pretty_please sudo
alias just_do_it sudo
alias i_beg_you sudo
alias let_me_do sudo
alias let_me_in sudo
alias please sudo
alias pls sudo

alias damnit="sudo \$history[1]"
alias fuck="sudo \$history[1]"

alias thankyou sudo
alias thx sudo

# Directory navigation
abbr --add ... 'z ../..'
abbr --add .... 'z ../../..'
abbr --add ..... 'z ../../../..'
abbr --add ...... 'z ../../../../..'
abbr --add ....... 'z ../../../../../..'
abbr --add ........ 'z ../../../../../../..'

# Package management
alias ratemirror 'sudo cachyos-rate-mirrors'
abbr --add updmirror 'sudo reflector --country Thailand,Singapore --latest 10 --sort rate --save /etc/pacman.d/mirrorlist && paru -Syy'
abbr --add clnlog 'sudo journalctl --vacuum-time=7d'
abbr --add lpkg 'paru -Q | fzf -e'
abbr --add lupkg 'paru -Qet | fzf -e'
abbr --add clnpkg 'paru -Rns (paru -Qtdq)'
abbr --add rmpkg 'paru -Rns (paru -Qetq | fzf -e -m)'

# File management
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias tch touch
alias mk touch
alias mkd mkdir
alias mkdir 'mkdir -pv'

alias df 'df -h'
alias du 'du -ch'
alias free 'free -h'

alias grep 'grep --color auto'
alias rg 'rg --color=always'

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
