function ls
    if command -q lsd
        lsd --header $argv
    else
        command ls --color=auto $argv
    end
end

function tree
    if command -q lsd
        lsd --tree -F $argv
    else
        command tree $argv
    end
end

alias ll="ls -AlF"
alias la="ls -A"
alias gs="git status"
alias jl="jj log"
alias gl="git log --stat --format=fuller"
alias jol="jj evolog"
alias gback="git checkout @{-1}"
alias gb="git branch -vv"
alias gcd="git checkout"
alias jcd="jj new -r"
# With diff
alias gshow="git show --format=fuller"
alias jshow="jj show"
# Without diff
alias gstat="git show --quiet --stat --format=fuller"
alias jstat="jj show --stat"
alias gsum="git show --summary"
alias jsum="jj show --summary"
alias gpush="git stash"
alias gpop="git stash pop"
alias cback="cd -"
alias kctl="kubectl"
alias bat="bat --paging='always'"
alias cargo_size="dir_size $CARGO_TARGET_DIR"
# For some reason SSH and tmux will sometimes not coordinate UTF-8 properly. This forces it.
alias tmux="tmux -u"
alias pyenv='source .venv/bin/activate.fish'
alias pyfmt='ruff format'
# Doesn't include --all-features to avoid testing compile heavy features in normal use
alias nextest-slim="cargo nextest run"
alias nextest="cargo nextest run --all-features"
alias nextest-hack="cargo hack nextest run --all-targets --feature-powerset"
alias clippy="cargo clippy --all-features --tests"
alias clippy-hack="cargo hack clippy --all-targets --feature-powerset"
# Unlike the other Cargo aliases this hits every crate. This is because `cargo fmt` doesn't take the `--check` and as
# such it has to be deferred directly to `rustfmt` which means this can't be passed *additional* args when used as an
# alias. This doesn't matter though because this command is fast even when hitting every crate.
alias rsfmt="cargo +nightly fmt --all -- --check"
alias rsdoc="cargo +nightly doc --all-features"
alias rsdoctest="cargo +nightly test --doc --all-features"
# Only relevant for as long as this feature is unstable.
alias rscript="cargo +nightly -Zscript"

alias weather="wthrr"
