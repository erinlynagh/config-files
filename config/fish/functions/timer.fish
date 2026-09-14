function timer --description 'Countdown timer with alarm, notifications, pause/resume, and sleep prevention'
    if test (count $argv) -ne 1
        echo "Usage: timer DURATION"
        echo "Examples: timer 20m, timer 1h30m, timer 45s"
        return 1
    end

    set -l duration $argv[1]
    set -l total 0

    # Parse duration
    set -l h (string match -r -g '([0-9]+)h' -- $duration)
    set -l m (string match -r -g '([0-9]+)m' -- $duration)
    set -l s (string match -r -g '([0-9]+)s' -- $duration)

    if test -n "$h"
        set total (math "$total + $h * 3600")
    end

    if test -n "$m"
        set total (math "$total + $m * 60")
    end

    if test -n "$s"
        set total (math "$total + $s")
    end

    if test $total -le 0
        echo "Invalid duration: $duration"
        return 1
    end

    # Prevent KDE from turning the screen off or putting the system to sleep.
    systemd-inhibit \
        --what=idle:sleep \
        --who="fish timer" \
        --why="Countdown timer is running" \
        fish -c 'sleep 2147483647' &

    set -l inhibit_pid $last_pid

    set -l remaining $total
    set -l paused false
    set -l minute_beeped false

    # Save terminal settings
    set -l old_stty (stty -g)
    stty -icanon -echo min 0 time 0

    while test $remaining -gt 0
        set -l hours (math --scale=0 "$remaining / 3600")
        set -l minutes (math --scale=0 "($remaining % 3600) / 60")
        set -l seconds (math --scale=0 "$remaining % 60")

        # One-minute warning
        if test $remaining -eq 60
            if test "$minute_beeped" = false
                paplay beep.mp3
                notify-send \
                    --app-name="Timer" \
                    --urgency=normal \
                    "⏱ 1 minute remaining" \
                    "Your timer will finish in 1 minute."
                set minute_beeped true
            end
        end

        # Clear the entire line
        printf '\r\e[2K'

        if test "$paused" = true
            if test $hours -gt 0
                printf "PAUSED — %dh %dm %ds remaining" $hours $minutes $seconds
            else
                printf "PAUSED — %dm %ds remaining" $minutes $seconds
            end
        else
            if test $hours -gt 0
                printf "%dh %dm %ds remaining" $hours $minutes $seconds
            else
                printf "%dm %ds remaining" $minutes $seconds
            end
        end

        # Check for Space
        set -l input (dd bs=1 count=1 iflag=nonblock 2>/dev/null)

        if test "$input" = " "
            if test "$paused" = true
                set paused false
            else
                set paused true
            end
        end

        if test "$paused" = false
            sleep 1
            set remaining (math "$remaining - 1")
        else
            sleep 0.1
        end
    end

    # Restore terminal
    stty $old_stty

    # Stop the sleep inhibitor
    kill $inhibit_pid 2>/dev/null

    # Completion
    printf '\r\e[2K'
    printf "Time's up!\n"

    paplay alarm.mp3

    notify-send \
        --app-name="Timer" \
        --urgency=critical \
        "⏰ Timer complete" \
        "Your $duration timer has finished."
end
