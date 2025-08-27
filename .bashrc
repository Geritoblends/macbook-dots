#!/bin/bash

## Define all the colors
COL_USER_HOST='\[\e[35m\]' # The color of 'user@host.ext'
COL_CURSOR='\[\e[35m\]' # The color of the trailing cursor arrow
COL_CURRENT_PATH='\[\e[37m\]' # The color of the current directory full path
COL_GIT_STATUS_CLEAN='\[\e[93m\]' # Color of fresh git branch name, with NO changes
COL_GIT_STATUS_CHANGES='\[\e[92m\]' # Color of git branch, affter its diverged from remote

## Text Styles
RESET='\[\e[0m\]' # What color will comand outputs be in
BOLD='\[\e[1m\]' # BOLD

## Config
SHOW_GIT=true

## If this is a valid git repo, echo the current branch name
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

## Echos what color the git branch should be (depending on changes)
parse_git_changes() {
if [[ $(git status --porcelain) ]]; then
echo ${COL_GIT_STATUS_CLEAN}
else
echo ${COL_GIT_STATUS_CHANGES}
fi
}

## Build-up what will be the final PS1 string
set_bash_prompt(){
PS1="${RESET}"
PS1+="${BOLD}${COL_USER_HOST}\u @ \h ${RESET}${COL_CURRENT_PATH}\w "

if [ "$SHOW_GIT" = true ] && [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ] ; then
PS1+="$(parse_git_changes)"
PS1+="$(parse_git_branch)"
fi

PS1+="\n${COL_CURSOR}└─▶ "
PS1+="${RESET}"
}

## Done, now just set the PS1 prompt :)
PROMPT_COMMAND=set_bash_prompt

[[ $- != *i* ]] && return
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='\n  \W  󰄾 '

export VIRTUAL_ENV_DISABLE_PROMPT=1


if [ -z "$SSH_AGENT_PID" ] || ! ps -p $SSH_AGENT_PID > /dev/null; then
eval "$(ssh-agent -s)" > /dev/null
fi

alias hyprconf="nvim -n ~/.config/hypr/hyprland.conf"
alias musictui="ncmpcpp"
alias waybarconf="nvim -n /home/gero/.config/waybar/config.jsonc"
alias waybarcss="nvim -n /home/gero/.config/waybar/style.css"
alias anyrunconf="nvim -n /home/gero/.config/anyrun/config.ron"
alias anyruncss="nvim -n /home/gero/.config/anyrun/style.css"
alias bedit="nvim -n /home/gero/.bashrc && source /home/gero/.bashrc"
alias bsource="source /home/gero/.bashrc"
alias cpustats="auto-cpufreq --stats"
alias snvim="sudo -E nvim -n"
alias kittyconf="nvim -n /home/gero/.config/kitty/kitty.conf"
alias footconf="nvim -n /home/gero/.config/foot/foot.ini"
alias nvimconf="nvim -n /home/gero/.config/nvim/init.lua"
alias projects="cd /home/gero/Documentos/projects"
alias mcservers="cd /home/gero/Documentos/'servers mc'"
alias gyg="cd /home/gero/Documentos/'servers mc'/gyg && ./start.sh"
alias hyprlockconf="nvim -n /home/gero/.config/hypr/hyprlock.conf"
alias flowersbg="swww img /home/gero/Documentos/wallpapers/flowers.jpg"
alias treesbg="swww img /home/gero/Documentos/wallpapers/foggytrees.jpg"
alias mountainsbg="swww img /home/gero/Documentos/wallpapers/mountains.jpg"
alias forestbg="swww img /home/gero/Documentos/wallpapers/forest.jpg"
alias gtk3css="nvim -n /home/gero/.config/gtk-3.0/gtk.css"
alias gtk4css="nvim -n /home/gero/.config/gtk-4.0/gtk.css"
alias modeperformance="sudo auto-cpufreq --force performance"
alias modereset="sudo auto-cpufreq --force reset"
alias pact='source $(poetry env info --path)/bin/activate'
alias deact='deactivate'
alias mimeappsconf="nvim -n /home/gero/.config/mimeapps.list"
alias starshipconf="nvim -n /home/gero/.config/starship.toml"
alias dunstconf="nvim -n /home/gero/.config/dunst/dunstrc"
alias tec="cd /home/gero/Documentos/Tec"
alias neofetch="fastfetch"
alias wallpapers="cd /home/gero/Imágenes/Wallpapers"
alias songs="ncmpcpp"
alias off="poweroff"
alias woficonf="nvim /home/gero/.config/wofi/config"
alias neofetch="fastfetch --logo-padding-top 5"
alias notas="cd /home/gero/Documentos/notas"
alias cr="cargo run --bin"
alias ct="cargo test --bin"
alias asciiquarium="asciiquarium --transparent"
alias clus="cd ~/Documentos/projects/clusterium_server/"
alias del="rm -rf"
alias bindir="cd /home/gero/.local/bin"
alias appsdir="cd /home/gero/.local/share/applications"
alias home="cd ~"
alias nvimdir="cd ~/.config/nvim"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias sqlclient="psql -h localhost -U postgres"
alias Descargas="cd ~/Descargas"
alias tree="tree -I target -I node_modules"
alias crb="cargo run --bin"
alias ccheck="cargo check"
alias nvimcolors="cd ~/.config/nvim/lua/colors"
alias tools="cd ~/tools"
alias woficss="nvim ~/.config/wofi/style.css"
alias woficonf="nvim ~/.config/wofi/config"
alias wlogoutcss="nvim ~/.config/wlogout/style.css"

# Temporal
alias rustlings="cd /home/gero/Documentos/projects/rustlings"
alias todoapp="cd /home/gero/Documentos/projects/todo-app"
alias gato="cd ~/Documentos/projects/gato-rs/ && nvim"
alias ccc="cargo check -p mongodb_client"
alias ccs="cargo check -p mongodb_server"
alias mdcu="docker-compose -f mongo_compose.yml up -d"
alias sem3="cd ~/Documentos/Tec/semestre3"
alias progra="sem3 && cd progra"
alias mate="sem3 && cd mate"
alias mong="mongosh \"mongodb://admin:password123@localhost:27017/\""
alias gac="gcc binarysearch.c -o bin && ./bin"
alias gec="gcc arbol.c -o bin && ./bin"
alias goc="gcc rombo.c -o bin && ./bin"
alias guc="gcc cuadrado.c -o bin && ./bin"
alias musica="sem3 && cd musica"
alias debate="sem3 && cd debate"
