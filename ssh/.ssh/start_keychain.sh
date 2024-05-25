#!/bin/bash
# Start `ssh-agent`, load specified SSH keys.
#
# See `man keychain` for more details.

# Add SSH keys here; assumes `~/.ssh`.
#
# This should be the private key's name. `keychain` assumes the public key is in the same directory and has the
# filename except with the `.pub` extension.
keys[0]="id_ed25519_github"
# keys[1]="..."

for key in ${keys[@]}
do
    # Note that incorrect or missing keys will be silently ignored. If the key you expected to add to `ssh-agent` does
    # not appear when using `keychain --list` you may have provided the wrong name.
    eval $(keychain --clear --eval ${key} 2> /dev/null)
done


unset keys key
