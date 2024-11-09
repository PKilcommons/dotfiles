function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color brred -o) "($last_status) " (set_color normal)
    end

    set -l display_pwd (prompt_pwd -d 3 -D 4)


    if set -q PROJECT_WORKSPACE
        set rel_path (_truncate_workspace; or echo $display_pwd)
    else
        set rel_path $display_pwd
    end

    string join '' -- \
        # "(1)" (assuming exit code 1)
        $stat \
        # "[12:30:12]"
        (set_color white -d) '[' (date +%H:%M:%S) '] ' (set_color normal) \
        # "username@hostname"
        (prompt_login) \
        # "~/foo/bar"
        (set_color blue -o) ':' $rel_path (set_color normal) \
        # "(master)"
        (vcs_prompt) \
        '$ '
end

function _truncate_workspace
    set -f truncated (string join '/' -- '.' (basename -- "$PROJECT_WORKSPACE"))
    if [ "$PWD" = "$PROJECT_WORKSPACE" ]
        echo $truncated
        return 0
    end

    set -l arr_pwd (string split -- "/" "$PWD")
    set -l arr_workspace (string split -- "/" "$PROJECT_WORKSPACE")
    set -l loop_len (math max (count $arr_pwd), (count $arr_workspace))

    for i in (seq $loop_len)
        if [ "$arr_workspace[$i]" != "$arr_pwd[$i]" ]
            # If the two arrays start disagreeing, and it's because the workspace has exhausted its paths (returning
            # empty), then we start appending the PWD directories ...
            if [ -z $arr_workspace[$i] ]
                set -f truncated (string join '/' -- "$truncated" "$arr_pwd[$i]")
            # ... Otherwise, it's because the PWD and workspace do not have a common ancestor, in which case we use a
            # non-truncated PWD.
            else
                return 1
            end
        end
    end
    echo $truncated
end
