cmd_create_help() {
    cat <<_EOF
    create
        Create the container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    Xephyr :$XDISPLAY -screen 800x600 -resizeable -retro -extension MIT-SHM -extension XTEST &
    sleep 2
    orig_cmd_create \
        --env DISPLAY=:$XDISPLAY \
        --mount type=bind,src=/tmp/.X11-unix/X$XDISPLAY,dst=/tmp/.X11-unix/X$XDISPLAY
}
