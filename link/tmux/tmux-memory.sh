#!/usr/bin/env bash
# shellcheck shell=bash

get_memory() {
    if [[ "$(uname)" == "Darwin" ]]; then
	memory=$(memory_pressure | awk '/percentage/{print $5}')
    else
        memory=$(free | grep Mem | awk '{printf "%.0f%%", $3/$2 * 100.0}')
    fi

    echo "$memory"
}

show_memory() {
    local index icon color text module

    index=$1
    icon="$(get_tmux_option "@catppuccin_test_icon" "󱑆")"
    color="$(get_tmux_option "@catppuccin_test_color" "$thm_orange")"
    text="$(get_tmux_option "@catppuccin_test_text" "#( get_memory )")"

    module=$(build_status_module "$index" "$icon" "$color" "$text")

    echo "$module"
}
