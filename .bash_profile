[[ -f ~/.bashrc ]] && . ~/.bashrc
eval "$(keychain --quiet --eval --timeout 30 id_ed25519)"
