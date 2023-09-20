# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/neovim/bin:$PATH"

# Custom env vars
export PIPX_DEFAULT_PYTHON=python3.11
export HATCH_PYTHON=$PIPX_DEFAULT_PYTHON
export CARGO_TARGET_DIR=$HOME/.cargo-target
export RUST_BACKTRACE=1
export GIT_PS1_SHOWSTASHSTATE=1
export ORG_GH_PAT=$(< $HOME/.github/org_pat)
export GCI_PAT=$(< $HOME/.github/gci_pat)
