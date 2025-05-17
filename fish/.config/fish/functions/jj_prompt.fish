function jj_prompt
    # Early exit if `jj` is not in PATH
    if not command -q jj
        return 1
    end

    jj st --ignore-working-copy &> /dev/null; or return 1

    set -l bookmark
    jj log --ignore-working-copy --no-graph -r @- -T bookmark_list \
        | string split ',' \
        | read -l bookmark

    if set -q bookmark[1]
        # Same colour as in `vcs_prompt.fish`
        set_color 5FFFAF
        echo " ($bookmark)"
        set_color normal
    else
        string join '' -- (set_color AE81FF) " (" $(jj where -r @- --ignore-working-copy --color always) \
        (set_color AE81FF) ")" (set_color normal)
    end
end
