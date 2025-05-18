#
# ~/.bashrc
#

# If not running interactively, don't do anything
pfetch

eval "$(starship init bash)"
[[ $- != *i* ]] && return
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='\n  \W  󰄾 '

export VIRTUAL_ENV_DISABLE_PROMPT=1


if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi 

alias hyprconf="nvim -n ~/.config/hypr/hyprland.conf"
alias musictui="ncmpcpp"
alias waybarconf="nvim -n /home/gero/.config/waybar/config.jsonc"
alias waybarcss="nvim -n /home/gero/.config/waybar/style.css"
alias anyrunconf="nvim -n /home/gero/.config/anyrun/config.ron"
alias anyruncss="nvim -n /home/gero/.config/anyrun/style.css"
alias bedit="nvim -n /home/gero/.bashrc"
alias bsource="source /home/gero/.bashrc"
alias cpustats="auto-cpufreq --stats"
alias snvim="sudo -E nvim -n"
alias kittyconf="nvim -n /home/gero/.config/kitty/kitty.conf"
alias footconf="nvim -n /home/gero/.config/foot/foot.ini"
alias nvimconf="nvim -n /home/gero/.config/nvim/init.lua"
alias projects="cd /home/gero/Documentos/projects"
alias mcservers="cd /home/gero/Documentos/'servers mc'"
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
