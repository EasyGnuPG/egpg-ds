FROM debian:buster

### install systemd
RUN apt update && apt -y upgrade
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt -y install systemd resolvconf
RUN systemctl set-default multi-user.target
RUN ln -s /lib/systemd/systemd /sbin/init

CMD ["/sbin/init"]
WORKDIR /host/egpg

### install dependencies
RUN apt -y install gnupg2 pinentry-tty haveged libgfshare-bin parcimonie \
        qrencode imagemagick zbar-tools wget coreutils psmisc make

### install ronn to make the man pages
RUN apt -y install ruby-dev gcc && \
    gem install ronn

### install jekyll for testing gh-pages locally
RUN apt -y install jekyll

### install man to test man pages locally inside container
RUN apt -y install less man
