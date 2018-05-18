cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    ds inject debian-fixes.sh
    [[ -d egpg ]] \
        || git clone --branch=gnupg-2.2 https://github.com/easygnupg/egpg
}
