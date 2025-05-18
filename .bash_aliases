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
alias gcc="git checkout sajeev/dev_python3"
alias gp="git push"
alias boom="ga .;gcm \"Changes: minor\"; gp"
alias boop="ga .; gco; gp"


# General CD Commands
alias cdm="cd ~/Desktop/Mable/"
alias cdv="cd ~/Desktop/Vaultedge/MR/vdoc.ai/"
alias cdV="cd ~/Videos/"
alias cdw="cd ~/Desktop/Vaultedge/MR/workbox/VDOC/"
alias cdd="cd ~/Downloads/"
alias cdD="cd ~/Desktop/"
alias cdn="cd ~/Desktop/Notes/March2025/"
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

# ssh
alias rsc="rsync -avL --progress -e \"ssh -i .secrets/server_new.key\""
alias rsc_prod="rsync -avL --progress -e \"ssh -i .secrets/mongo_prod_rsa.key\""

# Games
alias mp2="wine /home/raghavendra/.wine/drive_c/Program\ Files\ \(x86\)/Remedy/Max\ Payne\ 2/MaxPayne2_cracked.exe"

# gcp
alias ve_prod="gcloud compute ssh --zone \"us-east1-b\" \"vm-prod-services-base-usea1-mgmt-01\" --tunnel-through-iap --project \"ve-prod-apps\""
alias ve_tc="gcloud compute ssh --zone \"us-east1-b\" \"vm-dev-services-base-usea1-jenkins-02\" --project \"ve-dev-apps\""
alias vetest="gcloud compute ssh --zone \"us-east1-c\" \"avanse\" --project \"ve-prod-apps\""

alias velgs="ssh ve -t \"docker exec -it ve-dev-9008 tail -f /var/log/uwsgi/flask_uwsgi.log; bash -l\""
alias velst="ssh ve -t \"docker exec -it ve-dev-9008 supervisorctl tail -f sutime; bash -l\""
alias veupd="ssh ve -t \"docker exec -it ve-dev-9008 bash /up.sh; bash -l\""
alias vemdb="ssh ve -t \"docker exec -it ve-dev-9008 mongo ve-dev-db/users -u dbuser -p dbuser; bash -l\""
alias ve="ssh ve"
alias i3l="i3lock & sleep 5 && xset dpms force off"


alias dcp="docker compose --project-name raghav_vdoc"
alias dps="docker compose --project-name raghav_vdoc ps"
alias de="docker exec -it"
alias dl="docker logs"
alias vdoc_prod="gcloud compute ssh --zone \"asia-south1-c\" \"vdoc-mongo\" --project \"ve-vdoc-app\" --tunnel-through-iap"
alias vdoc_demo="gcloud compute ssh --zone \"asia-south1-c\" \"gregg-and-valby-vm\" --project \"ve-vdoc-app\" --tunnel-through-iap"



# Daily Notes type stuff
alias vdn="vim \"/home/raghaveendrawork/Desktop/Notes/$(date %b%Y)/$(date +%d_%b_%Y).md\""



# From hereon, I will be using 'cd' as a prefix to all of the aliases to move to different kinds of places
alias cddt="cd /home/raghaveendrawork/Desktop/ObsidianVaults/Daily\ Tracker"

# General commands
alias lth="ls -lt | head"

alias docker="sudo docker"
