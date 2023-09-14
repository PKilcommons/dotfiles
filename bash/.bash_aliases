alias gs="git status"
alias gl="git log"
alias gback="git checkout @{-1}"
alias gb="git branch"
alias gcd="git checkout"
# Doesn't include --all-features to avoid testing compile heavy features in normal use
alias nextest-slim="cargo nextest run"
alias nextest="cargo nextest run --all-features"
alias clippy="cargo +nightly clippy --all-features --tests -Zlints"
