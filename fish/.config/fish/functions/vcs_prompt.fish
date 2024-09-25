function vcs_prompt
    if jj_prompt
        return 0
    else
        # I have no idea where this colour is actually originated from in the `git-prompt.sh` so I just grabbed the hex
        # from a screenshot with the a paint drop tool.
        set_color 5FFFAF
        fish_vcs_prompt
        set_color normal
    end
end
