function jj_prompt
    jj st --ignore-working-copy &> /dev/null; or return 1

    set -l bookmark
    jj log --ignore-working-copy --no-graph -r @ -T 'bookmarks.map(|b| b.name()).join(",")' \
        | string split ',' \
        | read -l bookmark

    if set -q bookmark[1]
        # Same colour as in `vcs_prompt.fish`
        set_color 5FFFAF
        echo " ($bookmark)"
        set_color normal
    else
        string join '' -- (set_color AE81FF) " (" $(jj where --ignore-working-copy --color always) \
        (set_color AE81FF) ")" (set_color normal)
    end
end
