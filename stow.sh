#!/bin/bash

dotfiles=(
    git
)

stowit() {
    usr=$1
    app=$2

    stow -vRt ${usr} ${app}
}

echo ""
echo "Stowing dotfiles for user: $(whoami)"

if [ $# -eq 0 ]; then
    for dotfile in ${dotfiles[@]}; do
        stowit ~ $dotfile
    done
else
    for dotfile in "$@"; do
        if [[ "${dotfiles[*]}" =~ "${dotfile}" ]]; then
            stowit ~ $dotfile
        else
            echo "Dotfile not found: $dotfile"
        fi
    done
fi

echo ""
echo "All dotfiles stowed successfully!"