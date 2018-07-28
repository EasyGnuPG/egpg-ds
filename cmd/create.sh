cmd_create_help() {
    cat <<_EOF
    create
        Create the container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    # based on the instructions found here:
    # https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-docker-container

    XSOCK=/tmp/.X11-unix
    XAUTH=$(pwd)/.docker.xauth
    xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
    chmod 644 $XAUTH

    orig_cmd_create \
        --net=host \
        --mount type=bind,src=$XSOCK,dst=$XSOCK,readonly \
        --mount type=bind,src=$XAUTH,dst=$XAUTH \
        --env DISPLAY=$DISPLAY \
        --env XAUTHORITY=$XAUTH
}
