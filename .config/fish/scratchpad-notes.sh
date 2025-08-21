#!/usr/bin/env fish

set SESSION_NAME "notes"
set NOTES_FILE "/home/raghavendragaleppa/Desktop/Notes/VENotes.md"

if type -q tmux
    if not set -q TMUX
        # Try to attach to "notes" session, or create if it doesn't exist
        tmux attach-session -t $SESSION_NAME
        or tmux new-session -s $SESSION_NAME "vim $NOTES_FILE"
    else
        exec fish
    end
else
    echo "Warning: tmux not found. Opening vim directly."
    cd (dirname $NOTES_FILE)
    vim (basename $NOTES_FILE)
end
