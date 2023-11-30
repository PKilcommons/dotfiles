alias gs="git status"
alias gl="git log --stat --format=fuller"
alias gback="git checkout @{-1}"
alias gb="git branch"
alias gcd="git checkout"
alias gshow="git show --quiet --stat --format=fuller"
alias cback="cd ~-" # cd - > /dev/null would also work
# Doesn't include --all-features to avoid testing compile heavy features in normal use
alias nextest-slim="cargo nextest run"
alias nextest="cargo nextest run --all-features"
alias nextest-hack="cargo hack nextest run --all-targets --feature-powerset"
alias clippy="cargo clippy --all-features --tests"
alias clippy-hack="cargo hack clippy --all-targets --feature-powerset"
alias rsdoc="cargo +nightly doc --all-features"
alias rsdoctest="cargo +nightly test --doc --all-features"

alias weather="wthrr"
