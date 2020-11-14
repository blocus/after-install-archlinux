main_message(){
	echo  -e "\033[1;32m${1}\033[0m"
}

debug_message(){
	echo  -e "\034[1;32m${1}\033[0m"
}

error_message(){
	echo  -e "\031[1;32m${1}\033[0m"
}


main_message "Ahmed Meftah installer"

su

debug_message "Populating archlinux"

pacman-key --populate archlinux 

MYPATH=`pwd`

debug_message "adding mirrors to pacman"

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && pacman-key --add sublimehq-pub.gpg && pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | tee -a /etc/pacman.conf

main_message "Main install with pacman"

debug_message "desktop packages"
pacman -Syu --noconfirm xorg xfce4 xfce4-goodies nvidia papirus-icon-theme
debug_message "utilities packages"
pacman -Syu --noconfirm wget pavucontrol sudo gvfs tmux network-manager unzip zip openssh openssl blueman bluez firefox-developer-edition linux-api-headers plank
debug_message "dev packages"
pacman -Syu --noconfirm php-apache mysql sublime-text git base-devel php nodejs npm code apache filezilla
debug_message "other packages"
pacman -Syu --noconfirm audacity clementine deluge-gtk deluge gimp inkscape obs-studio powerline-common powerline powerline-fonts powerline-vim
debug_message "font packages"
pacman -S  --noconfirm adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts cantarell-fonts gnu-free-fonts noto-fonts noto-fonts-emoji ttf-joypixels ttf-dejavu otf-font-awesome powerline-fonts ttf-anonymous-pro ttf-roboto

debug_message "Install from AUR"

su meftah
sh install_from_aur.sh
exit 

debug_message "Installing composer"

sh install_composer.sh

debug_message "Enabling and starting services"


DEAMONS=(httpd mariadb blueman-mechanism bluetooth mongodb NetworkManager)

for deamon in ${DEAMONS[@]};do
	systemctl enable ${deamon}.service
	systemctl start ${deamon}.service
done 

