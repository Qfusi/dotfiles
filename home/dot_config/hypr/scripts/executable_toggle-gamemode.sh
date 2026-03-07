#!/usr/bin/env bash
#                                      __
#   ___ ____ ___ _  ___ __ _  ___  ___/ /__
#  / _ `/ _ `/  ' \/ -_)  ' \/ _ \/ _  / -_)
#  \_, /\_,_/_/_/_/\__/_/_/_/\___/\_,_/\__/
# /___/
#

GAMEMODE_VALUES_FILE="$HOME/.cache/hypr/gamemode.values"

_saveCurrentSettings() {
    mkdir -p "$(dirname "$GAMEMODE_VALUES_FILE")"
    
    {
        echo $(hyprctl getoption animations:enabled -j | jq -r '"\(.option)=\(.int)"')
        echo $(hyprctl getoption decoration:shadow:enabled -j | jq -r '"\(.option)=\(.int)"')
        echo $(hyprctl getoption decoration:blur:enabled -j | jq -r '"\(.option)=\(.int)"')
        echo $(hyprctl getoption decoration:rounding -j | jq -r '"\(.option)=\(.int)"')
        echo $(hyprctl getoption general:gaps_in -j | jq -r '"\(.option)=\(.custom)"')
        echo $(hyprctl getoption general:gaps_out -j | jq -r '"\(.option)=\(.custom)"')
        echo $(hyprctl getoption general:border_size -j | jq -r '"\(.option)=\(.int)"')
    } > "$GAMEMODE_VALUES_FILE"
}

_restoreSettings() {
    if [ ! -f "$GAMEMODE_VALUES_FILE" ]; then
        return 1
    fi
    
    local commands=""
    while IFS='=' read -r option value; do
        commands+="keyword $option $value;"
    done < "$GAMEMODE_VALUES_FILE"
    
    hyprctl --batch "$commands"
}

_enableGameMode() {
    _saveCurrentSettings
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword decoration:rounding 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1" > /dev/null
}

_disableGameMode() {
    _restoreSettings
}

case "$1" in
    1)
        _enableGameMode
        ;;
    0)
        _disableGameMode
        ;;
esac