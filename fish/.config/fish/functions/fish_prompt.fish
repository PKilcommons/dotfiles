function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color brred -o) "($last_status) " (set_color normal)
    end

    if set -q $PROJECT_WORKSPACE
        # TODO: Do the shrinking: `./hivo-app`
        # https://fishshell.com/docs/current/cmds/path.html
        set rel_path "TODO"
    else
        set rel_path (prompt_pwd -d 3 -D 4)
    end

    string join '' -- \
        $stat \
        '[' (date +%H:%M:%S) '] ' \
        (prompt_login) (set_color blue -o) ':' $rel_path (set_color normal) (vcs_prompt) '$ '
end
