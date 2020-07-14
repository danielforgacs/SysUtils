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

# Backup sys files
bkpdir=~/Original.Sys.Files/
mkdir $bkpdir
cp /etc/fstab \
	/etc/default/grub \
	/etc/adduser.conf \
	/etc/sysctl.conf \
	/etc/default/motd-news \
	/etc/apt/apt.conf.d/20auto-upgrades \
	$bkpdir

# Set swappiness
sudo echo "

vm.swappiness=20
" >> /etc/sysctl.conf

# Sys settings:
sudo sed -i 's:Update-Package-Lists "1":Update-Package-Lists "0":g' /etc/apt/apt.conf.d/20auto-upgrades
sudo sed -i 's:Unattended-Upgrade "1":Unattended-Upgrade "0":g' /etc/apt/apt.conf.d/20auto-upgrades
sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub && \
	sudo update-grub
sudo sed -i 's:DIR_MODE=0755:DIR_MODE=700:g' /etc/adduser.conf
sudo sed -i "s:ENABLED=1:# ENABLED=0:g" /etc/default/motd-news
sudo sed -i "s:URLS=\"https:# URLS=\"https:g" /etc/default/motd-news
sudo chmod 700 /home/ford
sudo swapoff /swapfile && \
	sudo rm /swapfile && \
	sudo fallocate -l 6g /swapfile && \
	sudo chmod 600 /swapfile && \
	sudo mkswap /swapfile && \
	sudo swapon /swapfile
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

# installs / uninstalls
sudo apt purge -y ghostscript-x ghostscript
sudo apt update
sudo add-apt-repository -y -u ppa:git-core/ppa && \
	sudo apt-get install -y git gitk git-gui
sudo sudo apt-get install -y docker.io && \
	sudo usermod -aG docker $USER
sudo apt install -y doublecmd-gtk ranger curl vim tree gnome-tweaks usb-creator-gtk
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
	sudo apt-get install -y apt-transport-https && \
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
	sudo apt-get update && \
	sudo apt-get install -y sublime-text
sudo apt-get -y clean && sudo apt-get -y autoremove && sudo apt-get -y autoclean

sudo snap install vlc



# video not playing in firefox:
	# (?) libxvidcore4 - found in xubuntu
	# restricted stuff installs fonts like microsoft fonts.
	# there is a better solution to install codecs only...!

# https://askubuntu.com/questions/248769/what-is-the-difference-between-ubuntu-kubuntu-xubuntu-and-lubuntu-restricted-e
# aut updates info: https://www.ostechnix.com/how-to-disable-unattended-upgrades-on-ubuntu/
# aut updates info: https://wiki.debian.org/UnattendedUpgrades


#=====================================================

# OLD INSTALLS:
# sudo apt install -y ffmpeg 
# sudo apt install -y mixxx
# sudo apt install -y virtualbox




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
