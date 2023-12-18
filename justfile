default:
    @just --choose

dry-run:
    chezmoi --verbose --dry-run apply

apply:
    chezmoi apply

clear:
    rm -rf ~/.config/chezmoi