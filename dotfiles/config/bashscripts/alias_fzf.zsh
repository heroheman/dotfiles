#!/bin/sh

echo 'LOAD FZF Functions'

FZFEXTRASDIR="~/.fzf-extras"

if [[ ! -e "$HOME/.fzf-extras/fzf-extras.zsh"  ]]; then
    echo "FZF Extras not found - will install"
    git clone https://github.com/atweiden/fzf-extras ~/.fzf-extras

# bash users only
cat >> ~/.bashrc <<'EOF'

[[ -e "$HOME/.fzf-extras/fzf-extras.sh" ]] \
  && source "$HOME/.fzf-extras/fzf-extras.sh"
EOF

# zsh users only
cat >> ~/.zshrc <<'EOF'

[[ -e "$HOME/.fzf-extras/fzf-extras.zsh" ]] \
  && source "$HOME/.fzf-extras/fzf-extras.zsh" \
  && source "$HOME/.fzf-extras/fzf-extras.sh"
EOF
fi
