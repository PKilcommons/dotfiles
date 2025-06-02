set -l COMP_PATH "$HOME/.config/fish/completions"
mkdir -p $COMP_PATH

if command -q jj
    jj util completion fish > "$COMP_PATH/jj.fish"
end

if command -q uv
    uv generate-shell-completion fish > "$COMP_PATH/uv.fish"
end
