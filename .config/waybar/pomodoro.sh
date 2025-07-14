#!/bin/bash

STATE_FILE="/tmp/pomodoro_state.json"
NOTIFY_FILE="/tmp/pomodoro_last_state"

notify_once() {
    local new_state="$1"
    local last_state=$(cat "$NOTIFY_FILE" 2>/dev/null)

    if [[ "$new_state" != "$last_state" ]]; then
        notify-send "Pomodoro" "Now: $new_state"
        echo "$new_state" > "$NOTIFY_FILE"
    fi
}

while true; do
    if [[ ! -f "$STATE_FILE" ]]; then
        echo '{"text": "⏸️ Pomodoro", "tooltip": "Not running"}'
        sleep 1
        continue
    fi

    # Read values
    start_time=$(jq -r .start_time "$STATE_FILE")
    work_sec=$(jq -r .work_duration "$STATE_FILE")
    break_sec=$(jq -r .break_duration "$STATE_FILE")
    rounds=$(jq -r .rounds "$STATE_FILE")

    now=$(date +%s)
    elapsed=$(( now - start_time ))
    cycle_length=$(( work_sec + break_sec ))
    current_round=$(( elapsed / cycle_length + 1 ))

    if (( current_round > rounds )); then
        echo '{"text": "✅ Done", "tooltip": "All rounds complete!"}'
        rm -f "$STATE_FILE"
        notify_once "Complete 🎉"
        sleep 1
        continue
    fi

    round_elapsed=$(( elapsed % cycle_length ))

    if (( round_elapsed < work_sec )); then
        state="Work"
        icon="🍅"
        time_left=$(( work_sec - round_elapsed ))
    else
        state="Break"
        icon="☕"
        time_left=$(( cycle_length - round_elapsed ))
    fi

    notify_once "$state Round $current_round"

    minutes=$(( time_left / 60 ))
    seconds=$(( time_left % 60 ))

    echo "{\"text\": \"$icon $minutes:$seconds\", \"tooltip\": \"$state - Round $current_round of $rounds\"}"
    sleep 1
done
