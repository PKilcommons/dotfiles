if status is-interactive; and command -q keychain
    # `keychain` checks `$SHELL` to figure out which shell syntax it can use. We temporarily set it to `fish` in order
    # to prevent errors at startup if it is not already the user's preferred shell (see `chsh`).
    set -f -x SHELL (which fish)
    keychain --eval --quiet -Q id_ed25519_github | source
end
