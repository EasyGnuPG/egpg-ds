#!/bin/bash -x

user=${1:-developer}
pass=${2:-pass}

### create account
useradd -d /home/$user -m -s /bin/bash -U  $user
chmod o-r -R /home/$user/

### set password
echo "$user:$pass" | chpasswd

### enable color prompt
sed -i /home/$user/.bashrc \
    -e '/^#force_color_prompt=/c force_color_prompt=yes'

### allow to use sudo without password
echo "$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
chmod 0440 /etc/sudoers.d/$user
echo "alias sudo='sudo -h 127.0.0.1'" >> /home/$user/.bash_aliases
