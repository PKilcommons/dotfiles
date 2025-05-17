# Print a quick summary of the current working directory's environment.
function myenv
    _py
    _rs
    _vcs
end

function _py
    if command -q uv
        echo -n "🐍"
        _bold_header "CPython" (eval (uv python find 2> /dev/null) --version 2> /dev/null | awk '{print $2}')
        echo "   $(uv --version 2> /dev/null)"

        if set -l pyproj (uv version --preview 2> /dev/null)
            echo "   $pyproj"
        end
    # TODO: Find system binaries and/or virtualenvs if `uv` is not installed
    end
end

function _rs
    if command -q rustup
        echo -n "🦀"
        _bold_header  "Rust" (rustc --version | awk '{print $2}')
        echo "   $(rustup --version 2> /dev/null | awk '{print $1,$2}')"
    end
end

function _vcs
    if jj status --ignore-working-copy &> /dev/null
        _vcs_utf8
        _bold_header "jj" (jj --version --ignore-working-copy | awk '{split($2, arr, "-"); print arr[1]}')
        echo "   $(jj log --ignore-working-copy --color always --no-graph -n 1 \
            -T 'format_short_id(change_id) ++ " " ++ format_short_id(commit_id) ++ " " ++ bookmark_list')"
    else if git status &> /dev/null
        _vcs_utf8
        _bold_header "git" (git --version | awk '{print $3}')
        echo -n "   $(git rev-parse --short=8 HEAD)"
        echo " $(git rev-parse --abbrev-ref HEAD)"
    else
    end
end

function _vcs_utf8
    set -l vcs_utf \uf407
    set_color -o yellow
    echo -n " $vcs_utf"
    set_color normal
end

function _bold_header
    set_color -o white
    echo -n " $argv[1] "
    set_color normal
    echo "$argv[2]"
end
