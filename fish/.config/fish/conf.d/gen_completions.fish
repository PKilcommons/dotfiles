if command -q jj
    jj util completion fish > "$HOME/.config/fish/completions/jj.fish"
end

if command -q uv
    uv generate-shell-completion fish > "$HOME/.config/fish/completions/uv.fish"
end
