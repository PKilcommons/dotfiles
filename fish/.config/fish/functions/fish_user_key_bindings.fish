function fish_user_key_bindings
    fzf --fish | source
    bind --user ctrl-left prevd-or-backward-word
    bind --user ctrl-right nextd-or-forward-word
end
