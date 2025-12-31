#!/usr/bin/env bash

# tmux-pilot - A lightweight session manager for tmux
# https://github.com/VheissuLabs/tmux-pilot

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get user options with defaults
get_option() {
    local option="$1"
    local default="$2"
    local value=$(tmux show-option -gqv "$option")
    echo "${value:-$default}"
}

# Configuration options
key=$(get_option "@pilot-key" "s")
width=$(get_option "@pilot-width" "60%")
height=$(get_option "@pilot-height" "60%")

# Bind the key to open pilot
tmux bind-key "$key" display-popup -E -w "$width" -h "$height" -b rounded "$CURRENT_DIR/scripts/pilot.sh"
