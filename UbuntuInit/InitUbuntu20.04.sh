bkpdir=~/Original.Sys.Files/
mkdir $bkpdir

cp /etc/fstab $bkpdir
cp /etc/default/grub $bkpdir
cp /etc/adduser.conf $bkpdir
cp /etc/sysctl.conf $bkpdir
cp /etc/default/motd-news $bkpdir

sudo apt purge -y ghostscript-x
sudo apt purge -y ghostscript
sudo apt update

sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub && sudo update-grub
sudo sed -i 's:DIR_MODE=0755:DIR_MODE=700:g' /etc/adduser.conf

sudo chmod 700 /home/ford
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
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
sudo sudo apt-get install -y docker.io && sudo usermod -aG docker $USER
sudo apt install -y doublecmd-gtk ranger python3-venv curl vim tree gnome-tweaks usb-creator-gtk

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
	sudo apt-get install -y apt-transport-https && \
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
	sudo apt-get update && \
	sudo apt-get install -y sublime-text

sudo snap install vlc


sudo sed -i "s:ENABLED=1:# ENABLED=0:g" /etc/default/motd-news
sudo sed -i "s:URLS=\"https:# URLS=\"https:g" /etc/default/motd-news


sudo apt-get -y clean && sudo apt-get -y autoclean && sudo apt-get -y autoremove



# video not playing in firefox:
	# (?) libxvidcore4 - found in xubuntu


#=====================================================

# OLD INSTALLS:
# sudo apt install -y ffmpeg 
# sudo apt install -y mixxx
# sudo apt install -y virtualbox



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

# echo '' && \
# 	echo '====================================' && \
# 	echo 'APT-GET INSTALLS' && \
# 	echo '===================================='
# sudo apt-get install -y gparted && \
# 	sudo apt-get install -y doublecmd-gtk && \
# 	sudo apt-get install -y python3-venv && \
# 	sudo apt-get install -y ranger && \
# 	sudo apt-get install -y vim && \
# 	sudo apt-get install -y gnome-tweaks && \
# 	sudo apt-get install -y curl && \
# 	sudo apt-get install -y dconf-editor && \
# 	sudo apt-get install -y usb-creator-gtk && \
# 	sudo apt-get install -y tree
	# sudo apt-get install -y htop && \
	# sudo apt-get install -y synaptic && \
	# sudo apt-get install -y baobab && \
	# sudo apt-get install -y deja-dup && \
