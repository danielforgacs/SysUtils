echo '' && \
	echo '====================================' && \
	echo 'BACKUP SYSTEM FILES' && \
	echo '===================================='
sudo cp /etc/sysctl.conf /etc/sysctl.conf.ORIGINAL && \
	sudo cp /etc/default/grub /etc/default/grub.ORIGINAL && \
	sudo cp /etc/adduser.conf /etc/adduser.conf.ORIGINAL && \
	sudo cp /etc/fstab /etc/fstab.ORIGINAL



echo '' && \
	echo '====================================' && \
	echo 'CLEAN, AUTOREMOVE & FULL-UPGRADE' && \
	echo '===================================='
sudo apt update && sudo apt full-upgrade -y && \
	sudo apt-get -y autoclean && \
	sudo apt-get -y clean && \
	sudo apt-get -y autoremove


echo '' && \
	echo '====================================' && \
	echo 'INSTALL GIT' && \
	echo '===================================='
sudo add-apt-repository -y -u ppa:git-core/ppa && \
	sudo apt-get install -y git gitk git-gui


echo '' && \
	echo '====================================' && \
	echo 'INSTALL SUBLIME TEXT' && \
	echo '===================================='
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
	sudo apt-get install -y apt-transport-https && \
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
	sudo apt-get update && \
	sudo apt-get install -y sublime-text


echo '' && \
	echo '====================================' && \
	echo 'INSTALL DOCKER.IO' && \
	echo '===================================='
sudo sudo apt-get install -y docker.io && \
	sudo usermod -aG docker $USER


echo '' && \
	echo '====================================' && \
	echo 'APT-GET INSTALLS' && \
	echo '===================================='
sudo apt-get install -y gparted && \
	sudo apt-get install -y htop && \
	sudo apt-get install -y doublecmd-gtk && \
	sudo apt-get install -y python3-venv && \
	sudo apt-get install -y ranger && \
	sudo apt-get install -y synaptic && \
	sudo apt-get install -y vim && \
	sudo apt-get install -y gnome-tweaks && \
	sudo apt-get install -y baobab && \
	sudo apt-get install -y curl && \
	sudo apt-get install -y tree



echo '' && \
	echo '====================================' && \
	echo 'CLEAN, AUTOREMOVE & FULL-UPGRADE' && \
	echo '===================================='
sudo apt update && sudo apt full-upgrade -y && \
	sudo apt-get -y autoclean && \
	sudo apt-get -y clean && \
	sudo apt-get -y autoremove


echo '' && \
	echo '====================================' && \
	echo 'TURN OFF STARTUP SPLASH SCREEN' && \
	echo '===================================='
sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub && \
	sudo update-grub


echo '' && \
	echo '====================================' && \
	echo '>>> INIT FINISHED <<<' && \
	echo '===================================='

