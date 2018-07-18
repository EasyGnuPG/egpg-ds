cmd_start() {
    Xephyr :$XDISPLAY -screen 800x600 -resizeable -retro -extension MIT-SHM -extension XTEST 2>/dev/null &
    sleep 2
    is_up && return
    docker start $CONTAINER
}

cmd_stop() {
    if [[ -f /tmp/.X$XDISPLAY-lock ]]; then
        kill -9 $(cat /tmp/.X$XDISPLAY-lock) 2>/dev/null
        rm -f /tmp/.X$XDISPLAY-lock
    fi

    is_up || return
    docker stop $CONTAINER 2>/dev/null
}
