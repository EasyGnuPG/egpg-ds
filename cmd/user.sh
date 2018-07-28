cmd_user_help() {
    cat <<_EOF
    user
        Start a bash shell as a non-root user.

_EOF
}

cmd_user() {
    ds exec sudo -h 127.0.0.1 -H -u developer bash
}
