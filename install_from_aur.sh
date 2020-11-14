AURS=(upd72020x-fw wd719x-firmware aic94xx-firmware mongodb-bin mongodb-tools-bin mongodb-compass nvm insomnia jdownloader2 anydesk-bin teamviewer )
PATHAUR=~/src


mkdir -p ~/PATHAUR
cd ~/PATHAUR

for url in ${AURS[@]}
do
	git clone https://aur.archlinux.org/${url}.git
	cd $url
	makepkg -si --noconfirm
	cd ..
	rm -rf $url	
done 

