# General git commands
alias ga="git add"
alias gco="git commit"
alias gcm="git commit -m"
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline"
alias gpu="git push origin"
alias gpl="git pull origin"
alias gplom="git pull origin main"
alias gc="git checkout"
alias gba="git branch -a"
alias gcb="git checkout -b"
alias gp="git push"
alias boom="ga .;gcm \"Changes: minor\"; gp"
alias boop="ga .; gco; gp"



# General CD Commands
alias cdV="cd ~/Videos/"
alias cdd="cd ~/Downloads/"
alias cdD="cd ~/Desktop/"
alias cdn="cd ~/Desktop/Notes/"
alias cddj="cd ~/Desktop/DialyJournals/"


# Source Files alias sba="source ~/.bash_aliases"
alias sbrc="source ~/.bashrc"
alias vba="vim ~/.bash_aliases"
alias sbac="source ~/.bash_aliases"
alias vbrc="vim ~/.bashrc"


# i3 based commands
alias vsm="vim ~/.config/sway/config"

# activate virtual env
alias va="source venv/bin/activate"
alias vd="deactivate"
alias vfc="vim ~/.config/fish/config.fish"
alias vi3="vim ~/.config/i3/config"

# vim commands
alias v="nvim"
alias vi="nvim"
alias vim="nvim"


# Games
alias mp2="wine /home/raghavendra/.wine/drive_c/Program\ Files\ \(x86\)/Remedy/Max\ Payne\ 2/MaxPayne2_cracked.exe"

alias i3l="i3lock & sleep 5 && xset dpms force off"



# From hereon, I will be using 'cd' as a prefix to all of the aliases to move to different kinds of places
alias cddt="cd /home/raghaveendrawork/Desktop/ObsidianVaults/Daily\ Tracker"

# General commands
alias lth="ls -lt | head"
alias docker="sudo docker"

# Novels
alias cdN="cd ~/Desktop/Novels/NovelDownloader/"

alias sv="source .venv/bin/activate.fish"

alias sk="sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0"
