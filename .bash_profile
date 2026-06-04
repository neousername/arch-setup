[[ -f ~/.bashrc ]] && . ~/.bashrc
eval "$(keychain --quiet --eval --timeout 120 id_ed25519)"
