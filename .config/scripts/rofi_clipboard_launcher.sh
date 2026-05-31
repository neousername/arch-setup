#!/usr/bin/env bash
selected=$(cliphist list | rofi -dmenu -p "Clipboard:" -theme "$HOME/.config/rofi/config.rasi")
[[ -z "$selected" ]] && exit 0

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

echo "$selected" | cliphist decode > "$tmp"
wl-copy --foreground < "$tmp"
