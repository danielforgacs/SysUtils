sudo apt purge ghostscript-x
sudo apt purge ghostscript
sudo apt update
sudo apt full-upgrade -y
mkdir ~/Original.Sys.Files
cp /etc/fstab ~/Original.Sys.Files/
cp /etc/default/grub ~/Original.Sys.Files/
sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub && sudo update-grub
cp /etc/adduser.conf ~/Original.Sys.Files/
sudo sed -i 's:DIR_MODE=0755:DIR_MODE=700:g' /etc/adduser.conf
sudo chmod 700 /home/ford
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
cp /etc/sysctl.conf ~/Original.Sys.Files/
sudo echo "

vm.swappiness=20
" >> /etc/sysctl.conf
sudo swapoff /swapfile && \
	sudo rm /swapfile && \
	sudo fallocate -l 6g /swapfile && \
	sudo chmod 600 /swapfile && \
	sudo mkswap /swapfile && \
	sudo swapon /swapfile

sudo add-apt-repository -y -u ppa:git-core/ppa && sudo apt-get install -y git gitk git-gui
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
	sudo apt-get install -y apt-transport-https && \
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
	sudo apt-get update && \
	sudo apt-get install -y sublime-text
sudo sudo apt-get install -y docker.io && sudo usermod -aG docker $USER
sudo snap install vlc

sudo apt-get -y clean && \
	sudo apt-get -y autoclean && \
	sudo apt-get -y autoremove

=====================================================


# PRE INSTALL CHECKLIST
	# - check firefox passwords
	# - force sync Firefox
	# - bookmark open tabs
	# - save bookmarks
	# - backup
	# - full storage backup
	# - check STORAGE mount options


# AFTER INSTALL CHECKLIST
	# - turn off auto install
	# - run this script...
	#	to check: $ cat /proc/sys/vm/swappiness
	#	update or add "vm.swappiness=20" to /etc/sysctl.conf
	# - firefox settings
	# - setup gamma: $ xgamma -gamma 1.23
	# - install dropbox & add manually to autostart 
	# - debloat

	# ? set disk write caching disk
	# ? set fix ip
	# ? Improve Ubuntu Battery by installing TLP for Linux
	# ? uncomplicated firewall
	#	$ sudo apt-get install gufw


# FIREFOX DEFAULT ZOOM:
	# (1) about:config
	# (2) filter "pix"
	# (3) layout.css.devPixelsPerPx 1.1


# OLD INSTALLS:
	# && sudo apt-get install -y ffmpeg \
# mixxx
# sudo apt-get install -y virtualbox


# echo '' && \
# 	echo '====================================' && \
# 	echo 'UNINSTALL' && \
# 	echo '===================================='
# sudo apt purge -y --auto-remove ghostscript && \
# 	sudo apt purge -y --auto-remove  gnome-online-accounts


# echo '' && \
# 	echo '====================================' && \
# 	echo 'BACKUP SYSTEM FILES' && \
# 	echo '===================================='
# sudo cp /etc/sysctl.conf /etc/sysctl.conf.ORIGINAL && \
	# sudo cp /etc/default/grub /etc/default/grub.ORIGINAL && \
	# sudo cp /etc/adduser.conf /etc/adduser.conf.ORIGINAL && \
	# sudo cp /etc/fstab /etc/fstab.ORIGINAL

	sudo sed -i "s:ENABLED=1:# ENABLED=0:g" /etc/default/motd-news
	sudo sed -i "s:URLS=\"https:# URLS=\"https:g" /etc/default/motd-news


# sudo apt update


# echo '' && \
# 	echo '====================================' && \
# 	echo 'INSTALL GIT' && \
# 	echo '===================================='
# sudo add-apt-repository -y -u ppa:git-core/ppa && \
# 	sudo apt-get install -y git gitk git-gui


# echo '' && \
# 	echo '====================================' && \
# 	echo 'INSTALL SUBLIME TEXT' && \
# 	echo '===================================='
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
# 	sudo apt-get install -y apt-transport-https && \
# 	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
# 	sudo apt-get update && \
# 	sudo apt-get install -y sublime-text


# echo '' && \
# 	echo '====================================' && \
# 	echo 'INSTALL DOCKER.IO' && \
# 	echo '===================================='
# sudo sudo apt-get install -y docker.io && \
# 	sudo usermod -aG docker $USER


echo '' && \
	echo '====================================' && \
	echo 'APT-GET INSTALLS' && \
	echo '===================================='
sudo apt-get install -y gparted && \
	sudo apt-get install -y doublecmd-gtk && \
	sudo apt-get install -y python3-venv && \
	sudo apt-get install -y ranger && \
	sudo apt-get install -y vim && \
	sudo apt-get install -y gnome-tweaks && \
	sudo apt-get install -y curl && \
	sudo apt-get install -y dconf-editor && \
	sudo apt-get install -y usb-creator-gtk && \
	sudo apt-get install -y tree
	# sudo apt-get install -y htop && \
	# sudo apt-get install -y synaptic && \
	# sudo apt-get install -y baobab && \
	# sudo apt-get install -y deja-dup && \


# echo '' && \
# 	echo '====================================' && \
# 	echo 'SNAP INSTALLS' && \
# 	echo '===================================='
# sudo snap install vlc


# echo '' && \
# 	echo '====================================' && \
# 	echo 'TURN OFF STARTUP SPLASH SCREEN' && \
# 	echo '===================================='
# sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub && \
# 	sudo update-grub



# echo '' && \
# 	echo '====================================' && \
# 	echo 'CONFIGS' && \
# 	echo '===================================='
# sudo sed -i 's:DIR_MODE=0755:DIR_MODE=700:g' /etc/adduser.conf && \
# 	sudo chmod 700 /home/ford

# gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false



# echo '' && \
# 	echo '====================================' && \
# 	echo 'SET SWAP' && \
# 	echo '===================================='
# sudo swapoff /swapfile && \
# 	sudo rm /swapfile && \
# 	sudo fallocate -l 6g /swapfile && \
# 	sudo chmod 600 /swapfile && \
# 	sudo mkswap /swapfile && \
# 	sudo swapon /swapfile && \
# 	sudo sed -i 's:/swapfile.*:/swapfile swap swap defaults 0 0:g' /etc/fstab


# echo '' && \
# 	echo '====================================' && \
# 	echo 'CLEAN, AUTOREMOVE & FULL-UPGRADE' && \
# 	echo '===================================='
# sudo apt-get -y autoclean && \
# 	sudo apt-get -y clean && \
# 	sudo apt-get -y autoremove
	# sudo apt update && \
	# sudo apt full-upgrade -y && \


# echo '' && \
# 	echo '====================================' && \
# 	echo '>>> INIT FINISHED <<<' && \
# 	echo '===================================='
