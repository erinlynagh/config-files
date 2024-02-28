if status is-interactive
    # Commands to run in interactive sessions can go here
end

oh-my-posh init fish --config ~/.config/oh-my-posh/themes/dracula.omp.json | source
zoxide init fish | source
cod init $fish_pid fish | source
