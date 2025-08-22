#!/usr/bin/env fish

# Ensure a profile name is provided
if not set -q argv[1]
    echo "Usage: (basename (status --current-filename)) <profile_name>"
    exit 1
end

set PROFILE $argv[1]

# Regex to find the Brave window title
if test "$PROFILE" = "Default"
    # Matches a title ending with " — Brave"
    set MATCH " — Brave\$"
else
    # Matches a title like " — Brave (Work)"
    set MATCH " — Brave \($PROFILE\)\$"
end

## --- FIX IS HERE --- ##

# Try to find an existing window for this profile
# We pass shell variables to jq using --arg and do all the logic inside jq
# This is more efficient than piping to grep, head, and awk.
set WIN_ID (swaymsg -t get_tree | jq -r --arg profile "$PROFILE" --arg match "$MATCH" '
    .. | objects | select(
        (.app_id? == $profile) or (.name? and (.name | test($match)))
    ) | .id' | head -n1)


if test -n "$WIN_ID"
    # Focus the existing window
    swaymsg "[con_id=$WIN_ID] focus"
else
    # Launch a new window
    # The ampersand (&) backgrounds the process
    brave-browser-nightly --class="$PROFILE" --profile-directory="$PROFILE" >/dev/null 2>&1 &
end
