toggle_pad() {
    if lsmod | grep -q '^bcm5974'; then
        sudo modprobe -r bcm5974
        echo "Trackpad disabled"
    else
        sudo modprobe bcm5974
        echo "Trackpad enabled"
    fi
}

reload-wifi() {
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
