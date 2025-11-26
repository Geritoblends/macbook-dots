toggle_pad() {
    if lsmod | grep -q '^bcm5974'; then
        sudo modprobe -r bcm5974
        echo "Trackpad disabled"
    else
        sudo modprobe bcm5974
        echo "Trackpad enabled"
    fi
}

reload_wifi() {
    sudo rmmod wl;
    sudo modprobe wl;
}

mkcd() {
    mkdir $1 && cd $1 
}

trimwav() {
    if [ $# -lt 3 ]; then
        echo "Usage: trimwav <input.wav> <start_seconds> <duration_seconds> [output.wav]"
        return 1
    fi

    local infile="$1"
    local start="$2"
    local dur="$3"
    local outfile="${4:-trimmed_${infile}}"

    sox "$infile" "$outfile" trim "$start" "$dur"
    echo "Created: $outfile"
}

trim_mp4() {
    if [ $# -lt 3 ]; then
        echo "Usage: trim_mp4 <input.mp4> <start_seconds> <duration_seconds> [output.mp4]"
        return 1
    fi

    local infile="$1"
    local start="$2"
    local dur="$3"
    local outfile="${4:-trimmed_${infile}}"

    # Nota: -ss va después de -i para que ffmpeg reescriba timestamps correctamente
    ffmpeg -i "$infile" -ss "$start" -t "$dur" -c copy -avoid_negative_ts make_zero "$outfile"

    echo "Created: $outfile"
}

cdf() {
  local dir
  dir=$(find . -type d 2>/dev/null | fzf) && cd "$dir"
}

rmf() {
  local file
  file=$(find . -maxdepth 1 -type f 2>/dev/null | fzf) && rm -i "$file"
}

rmfm() {
  local file
  file=$(find . -maxdepth 1 -type f 2>/dev/null | fzf -m) && rm -i "$file"
}

nvimf() {
  local file
  file=$(fd --hidden --exclude .git --type f | fzf) && nvim "$file"
}

nvimrg() {
    nvim $(rg -l "$1")
}

zip_current() {
    # Get the name of the current folder
    local folder_name
    folder_name=$(basename "$PWD")

    # Set the output zip path
    local output="../${folder_name}.zip"

    # Zip the current folder into the output path
    zip -r "$output" .

    echo "Zipped '$folder_name' to '$output'"
}

cutfile() { mv "$1" ~/.clipboard/; }
pastefile() { mv ~/.clipboard/"$1" .; }

cloud() {
    # Save current title
    local old_title=$(printf "\033]0;$(hostnamectl hostname)\007")

    # Set title to "cloud"
    echo -ne "\033]0;cloud\007"

    # SSH into your cloud machine
    ssh gero@minecrafsito.hopto.org -p 22

    # Restore original title
    echo -ne "$old_title"
}

localcloud() {
    # Save current title
    local old_title=$(printf "\033]0;$(hostnamectl hostname)\007")

    # Set title to "cloud"
    echo -ne "\033]0;cloud\007"

    # SSH into your cloud machine
    ssh gero@192.168.1.67 -p 22

    # Restore original title
    echo -ne "$old_title"
}

nvimfm() {
    nvim $(fd --hidden --exclude .git --type f | fzf -m)
}

tmp() {
  mkdir -p ~/.tmp

  # Verifica si se proporcionó un nombre de archivo
  if [ -z "$1" ]; then
    echo "Uso: tmp <nombre_archivo>"
    return 1
  fi

  local file_path=~/.tmp/$1

  echo "Abriendo: ${file_path}"
  
  # Abre el archivo con nvim
  nvim "$file_path"
}

tmpf() {
  mkdir -p ~/.tmp
  find ~/.tmp -type f | fzf --preview 'cat {}' | xargs -r nvim
}

lbin() {
    # Define the target directory
    local bin_dir=~/.local/bin

    # Create the directory if it doesn't exist
    mkdir -p "$bin_dir"

    # Check if a filename was provided
    if [ -z "$1" ]; then
        echo "Uso: lbin <nombre_script>"
        return 1
    fi

    local file_path="$bin_dir/$1"

    # Check if the file already exists
    if [ ! -f "$file_path" ]; then
        echo "Creando y preparando script: ${file_path}"
        # Set the execute permission for the first time
        chmod +x "$file_path"
        # Optional: Add a shebang line for new files
        echo '#!/bin/bash' > "$file_path"
    else
        echo "Abriendo script: ${file_path}"
    fi

    # Open the file with nvim
    nvim "$file_path"
}

lbinf() {
    local bin_dir=~/.local/bin
    
    # Create the directory if it doesn't exist (ensuring fzf doesn't search a non-existent dir)
    mkdir -p "$bin_dir"
    
    # Find all files (scripts) in the bin directory, use fzf to select one, and open it with nvim
    find "$bin_dir" -type f | fzf --preview 'cat {}' | xargs -r nvim
}
