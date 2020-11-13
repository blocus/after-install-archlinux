sudo pacman-key --populate archlinux 

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu wget gvfs tmux php-apache unzip zip mysql sublime-text openssh openssl xorg xfce4 xfce4-goodies firefox-developer-edition git base-devel php nodejs npm nvidia code code apache audacity blueman bluez clementine deluge-gtk deluge filezilla gimp inkscape linux-api-headers obs-studio plank powerline-common powerline powerline-fonts powerline-vim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

sudo php composer-setup.php  --install-dir=/bin  --filename=composer  --quiet
rm composer-setup.php

sudo systemctl enable httpd.service
sudo systemctl enable mariadb.service

sudo systemctl enable blueman-mechanism.service 
sudo systemctl enable bluetooth.service

sudo systemctl start blueman-mechanism.service 
sudo systemctl start bluetooth.service
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/


# sudo rm -fr /var/mysql/* /var/lib/mysql/* /var/log/mysql/*
# sudo chown -R mysql:mysql /var/mysql /var/lib/mysql /var/log/mysql
# sudo bash -c "cd /var/lib ; mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql"

mkdir ~/src
cd ~/src

git clone https://aur.archlinux.org/upd72020x-fw.git
git clone https://aur.archlinux.org/wd719x-firmware.git
git clone https://aur.archlinux.org/aic94xx-firmware.git
git clone https://aur.archlinux.org/mongodb-compass.git
git clone https://aur.archlinux.org/mongodb-tools-bin.git
git clone https://aur.archlinux.org/mongodb-bin.git
git clone https://aur.archlinux.org/nvm.git
git clone https://aur.archlinux.org/insomnia.git
git clone https://aur.archlinux.org/jdownloader2.git
git clone https://aur.archlinux.org/anydesk-bin.git
git clone https://aur.archlinux.org/teamviewer.git