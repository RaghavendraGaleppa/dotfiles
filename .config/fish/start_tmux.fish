#!/usr/bin/fish

# This script is designed to be run from Sway/Alacritty.
# It ensures that Alacritty always starts within a tmux session.
set SESSION_NAME "main"

if test -n "$argv[1]"
    set SESSION_NAME "$argv[1]"
end

# Check if tmux command exists
if type -q tmux
    # Check if we are already inside a tmux session (important for nesting prevention)
    if not set -q TMUX
        # Try to attach to a session named 'main'.
        # If 'main' doesn't exist, create a new session named 'main'.
        tmux attach-session -t $SESSION_NAME
        or tmux new-session -s $SESSION_NAME
    else
        # If for some reason this script is run *inside* tmux (e.g., from a new pane),
        # just execute the default shell.
        exec fish
    end
else
    # If tmux is not found, just start a normal fish shell
    echo "Warning: tmux not found. Starting a regular fish shell."
    exec fish
end
