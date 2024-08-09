set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/.pyenv/bin" $PATH
set -gx PATH "/usr/local/go/bin" $PATH

set -gx EDITOR "nvim"

fzf --fish | source

export TERMINAL="wezterm"
export PYENV_ROOT="$HOME/.pyenv"
