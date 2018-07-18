FROM ubuntu:18.04

### install systemd
RUN apt update && \
    apt upgrade -y && \
    apt install -y systemd && \
    systemctl set-default multi-user.target

CMD ["/sbin/init"]
WORKDIR /host/egpg

### install dependencies
RUN apt install -y gnupg2 pinentry-tty haveged libgfshare-bin parcimonie \
        qrencode imagemagick zbar-tools wget coreutils psmisc make sudo

### disable the option `-w 1024` of haveged daemon
### because it requires a container with `--cap-add SYS_ADMIN`
### (in order to be able to write to `/proc/sys/kernel/random/write_wakeup_threshold`)
RUN sed -i /etc/default/haveged -e '/^DAEMON_ARGS/ s/^/#/'

### install ronn to make the man pages
RUN apt install -y ruby-dev gcc && \
    gem install ronn

### install jekyll for testing gh-pages locally
RUN apt install -y jekyll

### install man to test man pages locally inside container
RUN apt install -y less man

### install yad for gui interfaces
RUN apt install -y yad

# ### install pgpg dependencies
# RUN apt install -y python3-gpg
#
# ### install ggpg dependencies
# RUN apt install -y python3-gi python3-gi-cairo gir1.2-gtk-3.0 python3-pip
# RUN pip3 install pygobject && \
#   pip3 install vext && \
#   pip3 install vext.gi
