function fish_title
    # If inside tmux, let tmux handle the outer terminal title
    if set -q TMUX
        return
    end

    set -l raw_title
    if set -q argv[1]
        set raw_title (string sub -l 20 -- $argv[1])" "(prompt_pwd -d 1 -D 1)
    else
        set -l command (status current-command)
        if test "$command" = fish
            set command
        end
        if test -n "$command"
            set raw_title (string sub -l 20 -- $command)" "(prompt_pwd -d 1 -D 1)
        else
            set raw_title (prompt_pwd -d 1 -D 1)
        end
    end

    # Calculate exact centered padding for Kitty macOS titlebar
    set -l title_len (string length -- $raw_title)
    set -l pad (math "max(0, floor($COLUMNS * 2 / 5 + 1.5 - $title_len * 0.42))")
    set -l blank (printf "\u2800")
    set -l spaces (string repeat -n $pad $blank)
    echo -- "$spaces$raw_title"
end
