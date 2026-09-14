function timer --description 'Countdown timer with alarm, notifications, pause/resume, and sleep prevention'
    set -l muted false
    set -l duration ""

    # -----------------------------
    # Parse arguments
    # -----------------------------
    for arg in $argv
        switch $arg
            case --mute -m
                set muted true

            case '-*'
                echo "Unknown option: $arg"
                echo "Usage: timer [--mute] DURATION"
                return 1

            case '*'
                if test -n "$duration"
                    echo "Only one duration may be specified."
                    return 1
                end
                set duration $arg
        end
    end

    if test -z "$duration"
        echo "Usage: timer [--mute] DURATION"
        echo "Examples: timer 20m, timer 1h30m, timer --mute 45s"
        return 1
    end

    # -----------------------------
    # Parse duration
    # -----------------------------
    set -l total 0

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

    # -----------------------------
    # Prevent idle/sleep
    # -----------------------------
    systemd-inhibit \
        --what=idle:sleep \
        --who="fish timer" \
        --why="Countdown timer is running" \
        sleep 2147483647 &

    set -l inhibit_pid $last_pid

    # -----------------------------
    # Terminal setup
    # -----------------------------
    set -l old_stty (stty -g)

    # Read individual keypresses without Enter.
    # min 0 + time 0 = return immediately if no key is waiting.
    stty -icanon -echo min 0 time 0

    set -l remaining $total
    set -l paused false
    set -l minute_beeped false

    # -----------------------------
    # Main timer
    # -----------------------------
    while test $remaining -gt 0

        # Calculate display values.
        set -l hours (math --scale=0 "$remaining / 3600")
        set -l minutes (math --scale=0 "($remaining % 3600) / 60")
        set -l seconds (math --scale=0 "$remaining % 60")

        # -------------------------
        # One-minute warning
        # -------------------------
        if test $remaining -eq 60
            if test "$minute_beeped" = false
                set minute_beeped true

                if test "$muted" = false
                    paplay beep.mp3 &
                end

                notify-send \
                    --app-name="Timer" \
                    --urgency=normal \
                    "⏱ 1 minute remaining" \
                    "Your timer will finish in 1 minute."
            end
        end

        # -------------------------
        # Draw timer
        # -------------------------
        printf '\r\e[2K'

        if test "$paused" = true
            if test $hours -gt 0
                printf "PAUSED — %dh %dm %ds remaining" \
                    $hours $minutes $seconds
            else
                printf "PAUSED — %dm %ds remaining" \
                    $minutes $seconds
            end
        else
            if test $hours -gt 0
                printf "%dh %dm %ds remaining" \
                    $hours $minutes $seconds
            else
                printf "%dm %ds remaining" \
                    $minutes $seconds
            end
        end

        # -------------------------
        # Check for a keypress
        # -------------------------
        set -l input (dd \
            iflag=nonblock \
            bs=1 \
            count=1 \
            2>/dev/null)

        if test "$input" = " "
            if test "$paused" = true
                set paused false
            else
                set paused true
            end
        end

        # -------------------------
        # Count down
        # -------------------------
        if test "$paused" = false
            sleep 1
            set remaining (math "$remaining - 1")
        else
            sleep 0.1
        end
    end

    # -----------------------------
    # Restore terminal
    # -----------------------------
    stty $old_stty

    # -----------------------------
    # Stop sleep inhibitor
    # -----------------------------
    kill $inhibit_pid 2>/dev/null

    # -----------------------------
    # Completion
    # -----------------------------
    printf '\r\e[2K'
    printf "Time's up!\n"

    notify-send \
        --app-name="Timer" \
        --urgency=critical \
        "⏰ Timer complete" \
        "Your $duration timer has finished."

    if test "$muted" = false
        paplay alarm.mp3
    end
end
