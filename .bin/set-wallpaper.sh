#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

if [ -z "$1" ]; then
  echo "Usage: $0 /full/path/to/wallpaper"
  exit 1
fi

NEW_PATH="$(realpath "$1")"
ESCAPED_PATH=$(printf '%s\n' "$NEW_PATH" | sed 's/[&/\]/\\&/g')
sed -i "s|^\s*path\s*=.*|  path = $ESCAPED_PATH|" "$CONFIG_FILE"

flavours generate dark $NEW_PATH
flavours apply generated

hyprctl hyprpaper wallpaper ",$NEW_PATH"

echo "Wallpaper updated to: $NEW_PATH"
