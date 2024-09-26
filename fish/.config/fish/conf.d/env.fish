# PATH
fish_add_path "$HOME/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "/usr/local/go/bin"
fish_add_path (go env GOPATH)
fish_add_path "$GOPATH/bin"
fish_add_path "$HOME/neovim/bin"

# Fish specific
set -gx fish_greeting # Empty greeting

# Conventional env
set -gx LANG en_US.UTF-8
set -gx EDITOR (which nvim)
set -gx PIPX_DEFAULT_PYTHON python3.12
set -gx HATCH_PYTHON $PIPX_DEFAULT_PYTHON
set -gx CARGO_TARGET_DIR "$HOME/.cargo-target"
set -gx RUST_BACKTRACE 1
set -gx KUBECONFIG "$HOME/.kube/config"
set -gx GIT_PS1_SHOWSTASHSTATE 1

# Custom env
if [ -f "$HOME/.github/org_pat" ]
    read -gx ORG_GH_PAT < "$HOME/.github/org_pat"
end

if [ -f "$HOME/.github/gci_pat" ]
    read -gx GCI_PAT < $HOME/.github/gci_pat
end
