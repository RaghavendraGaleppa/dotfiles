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


set -gx PYTHONPATH /home/raghaveendrawork/Desktop/ChineseNovelTranslation/ChatGPTBot/record-and-play-pynput
set -gx OPENROUTER_API_KEY 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

set -U fish_user_paths /home/raghaveendrawork/bin $fish_user_paths

# Start or attach to a tmux session when the shell starts in an interactive session. ALL
if status is-interactive
    if type -q tmux
        if not set -q TMUX
            # Check if a session named 'main' exists, if not, create it.
            # Then attach to it.
            # 'and' in fish is equivalent to '&&' in bash/zsh
            # 'or' in fish is equivalent to '||' in bash/zsh
            tmux attach-session -t main
            or tmux new-session -s main
        end
    end
end
