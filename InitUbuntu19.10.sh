# ---------------------------
# PRE INSTALL CHECKLIST
#
# - save open tabs
# - save bookmarks
# - force sync Firefox
# - backup

# ---------------------------
# AFTER INSTALL CHECKLIST
#
# - turn off auto install
# run this script...
# - set swappiness
# - firefox settings
# - firefox extensions
# - setup & restore backup
# - setup gamma:
# $ xgamma -gamma 1.15
# https://ubuntu-mate.community/t/how-to-change-screen-gamma-using-xgamma/12969

# Firefox Extensions:
# https://addons.mozilla.org/en-US/firefox/addon/ublock-origin
# https://addons.mozilla.org/en-US/firefox/addon/noscript
# https://addons.mozilla.org/en-US/firefox/addon/ghostery
# https://addons.mozilla.org/en-US/firefox/addon/block-website
#
# https://addons.mozilla.org/en-US/firefox/addon/adblocker-ultimate
# https://addons.mozilla.org/en-US/firefox/addon/adblock-for-youtube
#
# https://addons.mozilla.org/en-GB/firefox/addon/smart-https-revived/
# ? https://addons.mozilla.org/en-GB/firefox/addon/https-everywhere/
# https://addons.mozilla.org/en-US/firefox/addon/privacy-possum
# https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17
# https://duckduckgo.com/
# https://addons.mozilla.org/en-US/firefox/addon/disconnect
# https://addons.mozilla.org/en-US/firefox/addon/decentraleyes
# ? https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete
# ? https://addons.mozilla.org/en-US/firefox/addon/bloody-vikings
# https://addons.mozilla.org/en-US/firefox/addon/facebook-container
# https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers

# UBUNTU 19.10

# DROPBOX INSTALL & AUTOSTART ADD MANUALLY

# ??? SET WRITE CACHING DISK

# ??? SET FIX IP

# !!! DEBLOAT

# sudo apt-get install -y virtualbox

# -----------------------------------------
# >>> SET SWAPPINESS
# to check: $ cat /proc/sys/vm/swappiness
# update or add "vm.swappiness=20" to /etc/sysctl.conf

# firefox settings !!!

# uncomplicated firewall
# ??? sudo apt-get install gufw

# Improve Ubuntu 18.04 Battery by installing TLP for Linux ???

# Flatpak ???


# install mixxx

# firefox default zoom:
# (1) In a new tab, type or paste about:config in the address bar and press Enter.
# 	Click the button promising to be careful.
# (2) In the filter box, type or paste pix and pause while the list is filtered
# (3) Double-click layout.css.devPixelsPerPx and change its value to 1.0 and
# 	click OK to save it. This will give you classic 96 dpi fonts. To enlarge that
# 	by 10%, double-click and use 1.1 and click OK. And so on. You may want to switch
# 	around between windows and tabs to see how it's affecting them.




sudo add-apt-repository -y -u ppa:git-core/ppa \
	&& wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - \
	&& sudo apt-get install apt-transport-https \
	&& echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list \
	&& sudo apt update \
	&& sudo apt-get install -y git git-gui gitk \
	&& sudo apt-get install -y sublime-text \
	&& sudo apt-get install -y docker.io \
	&& sudo usermod -aG docker $USER \
	&& sudo apt-get install -y gparted \
	&& sudo apt-get install -y htop \
	&& sudo apt-get install -y doublecmd-gtk \
	&& sudo apt-get install -y python3-venv \
	&& sudo apt-get install -y ranger \
	&& sudo apt-get install -y synaptic \
	&& sudo apt-get install -y vim \
	&& sudo apt-get install -y gnome-tweaks \
	&& sudo apt-get install -y baobab \
	&& sudo apt-get install -y curl \
	&& sudo apt-get install -y deja-dup \
	&& sudo apt-get install -y dconf-editor \
	&& sudo apt-get install -y duplicity \
	&& sudo apt-get install -y usb-creator-gtk \
	&& sudo apt-get install -y tree \
	&& sudo apt-get install -y ffmpeg \
	&& sudo snap install vlc \
	&& sudo apt purge -y --auto-remove  ghostscript ghostscript:i386 gsfonts \
	&& sudo apt purge -y --auto-remove  gnome-online-accounts \
	&& sudo cp /etc/default/grub /etc/default/grub.ORIGINAL \
	&& sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub \
	&& sudo update-grub \
	&& sudo cp /etc/adduser.conf /etc/adduser.conf.ORIGINAL \
	&& sudo sed -i 's:DIR_MODE=0755:DIR_MODE=700:g' /etc/adduser.conf \
	&& sudo chmod 700 /home/ford \
	&& sudo cp /etc/fstab /etc/fstab.ORIGINAL \
	&& sudo swapoff /swapfile \
	&& sudo rm /swapfile \
	&& sudo fallocate -l 6g /swapfile \
	&& sudo chmod 600 /swapfile \
	&& sudo mkswap /swapfile \
	&& sudo swapon /swapfile \
	&& sudo sed -i 's:/swapfile.*:/swapfile swap swap defaults 0 0:g' /etc/fstab \
	&& sudo cp /etc/sysctl.conf /etc/sysctl.conf.ORIGINAL \
	&& gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false \
	&& sudo apt-get autoclean \
	&& sudo apt-get clean \
	&& sudo apt-get autoremove \
	&& echo '' \
	&& echo '-----------------------------' \
	&& echo '--> INIT FINISHED...' \
	&& echo '-----------------------------'
