#!/usr/bin/env bash
#                         __     
#   __ _  ___ _  _____   / /____ 
#  /  ' \/ _ \ |/ / -_) / __/ _ \
# /_/_/_/\___/___/\__/  \__/\___/
#                                

target_workspace=$1

if [ -z "$target_workspace" ]; then
    exit 1
fi

current_workspace=$(hyprctl activewindow -j | jq '.workspace.id')

if [ -z "$current_workspace" ]; then
    exit 1
fi

window_addresses=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $current_workspace) | .address")

for address in $window_addresses; do
    hyprctl dispatch movetoworkspacesilent "$target_workspace,address:$address"
done

hyprctl dispatch workspace "$target_workspace"