if status is-interactive
     # Commands to run in interactive sessions can go here
end
source ~/.bash_aliases

if test -e ~/.bash_aliases_work
    source ~/.bash_aliases_work
end

# Fish related Settings

#fish_vi_key_bindings
#status --is-interactive; and . (pyenv init -|psub)
#status --is-interactive; and . (pyenv virtualenv-init -|psub)
#
#set -gx PYENV_SHELL fish
#source '/home/raghaveendrawork/.pyenv/libexec/../completions/pyenv.fish'
#command pyenv rehash 2>/dev/null
#function pyenv
#  set command $argv[1]
#  set -e argv[1]
#
#  switch "$command"
#  case activate deactivate rehash shell
#    source (pyenv "sh-$command" $argv|psub)
#  case '*'
#    command pyenv "$command" $argv
#  end
#end

#pyenv init - | source

function fish_prompt
    echo -n (basename (pwd)) ' > '
end


set -gx OPENROUTER_API_KEY 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

set -U fish_user_paths /home/raghaveendrawork/bin $fish_user_paths


string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)




# Specifics for pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"
fish_add_path "$PYENV_ROOT/bin"
pyenv init - | source



# Only try to set SWAYSOCK if we are actually in a Sway session
if set -q SWAYSOCK; or test "$XDG_SESSION_DESKTOP" = "sway"
    set -l sway_socket (ls -t /run/user/(id -u)/sway-ipc.*.sock 2>/dev/null | head -n1)
    if test -n "$sway_socket"
        set -gx SWAYSOCK $sway_socket
    end
end
