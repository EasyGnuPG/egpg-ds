cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    ds inject set_prompt.sh
    ds exec bash -c \
       "echo \"alias sudo='sudo -h 127.0.0.1'\" >> /root/.bash_aliases"
    ds inject create-user.sh
    [[ -d egpg ]] \
        || git clone --branch=gnupg-2.2 https://github.com/easygnupg/egpg
}
