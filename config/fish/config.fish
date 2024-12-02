if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Themes
## Minimal Themes
## one line; no git
# oh-my-posh init fish --config ~/.config/oh-my-posh/themes/space.omp.json | source
## very minimal; has git
# oh-my-posh init fish --config ~/.config/oh-my-posh/themes/pure.omp.json | source

## Colourful Themes
# oh-my-posh init fish --config ~/.config/oh-my-posh/themes/M365Princess.omp.json | source
oh-my-posh init fish --config ~/.config/oh-my-posh/themes/dracula.omp.json | source

set best_flag "\033[48;5;196m\033[38;5;6m██\033[0m\033[48;5;196m\033[38;5;5m██\033[0m\033[48;5;196m\033[38;5;15m██\033[0m\033[48;5;196m\033[38;5;5m██\033[0m\033[48;5;196m\033[38;5;6m██\033[0m\n"

for x in (seq 5)
    if test "$x" -eq 3
        echo " :3 :3 :3"
    else
        printf  $best_flag
    end
end
echo