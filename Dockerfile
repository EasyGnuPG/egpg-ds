include(buster)

### install dependencies
RUN apt install --yes gnupg2 pinentry-tty haveged libgfshare-bin parcimonie \
        qrencode imagemagick zbar-tools wget coreutils psmisc make sudo

### disable the option `-w 1024` of haveged daemon
### because it requires a container with `--cap-add SYS_ADMIN`
### (in order to be able to write to `/proc/sys/kernel/random/write_wakeup_threshold`)
RUN sed -i /etc/default/haveged -e '/^DAEMON_ARGS/ s/^/#/'

### install ronn to make the man pages
RUN apt install --yes ruby-dev gcc && \
    gem install ronn

### install jekyll for testing gh-pages locally
RUN apt install --yes jekyll

### install man to test man pages locally inside container
RUN apt install --yes less man
