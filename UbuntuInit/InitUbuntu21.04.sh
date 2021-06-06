# ######################################################################
# ######################################################################
# PRE INSTALL CHECKLIST

	# - check firefox passwords
	# - force sync Firefox
	# - bookmark open tabs
	# - save bookmarks
	# - backup
	# - full storage backup
	# - check STORAGE mount options




# ######################################################################
# ######################################################################
# AFTER INSTALL CHECKLIST

	# - turn off auto install
	# - run this script...
	#	to check: $ cat /proc/sys/vm/swappiness
	#	update or add "vm.swappiness=20" to /etc/sysctl.conf
	# - firefox settings
	# - setup gamma: $ xgamma -gamma 1.23
	# - install dropbox & add manually to autostart
	# - debloat

    # check these, these are used to fetch some news on updates...
    # ubuntu "Message of the Day" files & swrvice...
    # doesn't exist:
    # /etc/default/motd-news
    # found:
    # /etc/systemd/system/timers.target.wants/motd-news.timer
    # /etc/update-motd.d/50-motd-news


    # Set swappiness manually in "/etc/sysctl.conf"
    # vm.swappiness=30
    # check:
    # $ cat /proc/sys/vm/swappiness

    # "gsd" services were set up differently in earlier versions...
    # https://www.funtoo.org/GNOME/Internals
    # systemctl --user stop       gsd-wacom.target
    # systemctl --user disable    gsd-wacom.target
    # systemctl --user stop       gsd-wacom.service
    # systemctl --user disable    gsd-wacom.service

    # Check auto update settings:
    # copying the next file causes a warning:
    # sudo cp /etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades.ORIGINAL




# ######################################################################
# ######################################################################
# Backup original sys files

sysfilesdir=~/OriginalSysFiles/
mkdir $sysfilesdir

sudo cp /etc/fstab $sysfilesdir
sudo cp /etc/default/grub $sysfilesdir
sudo cp /etc/adduser.conf $sysfilesdir
sudo cp /etc/sysctl.conf $sysfilesdir
sudo cp /etc/apt/apt.conf.d/20auto-upgrades $sysfilesdir




# ######################################################################
# ######################################################################
# Sys settings

sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub
sudo update-grub

gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

# some unnecessary new update...
# sudo sed -i 's:Update-Package-Lists "1":Update-Package-Lists "0":g' /etc/apt/apt.conf.d/20auto-upgrades
# sudo sed -i 's:Unattended-Upgrade "1":Unattended-Upgrade "0":g' /etc/apt/apt.conf.d/20auto-upgrades

# New user dir permission settings... ! ubuntu defaults changed !
# sudo sed -i 's:DIR_MODE=0755:DIR_MODE=700:g' /etc/adduser.conf

# sudo sed -i "s:ENABLED=1:# ENABLED=0:g" /etc/default/motd-news

# May not be neessary with the new ubuntu defaults
# sudo chmod 700 /home/ford




# ######################################################################
# ######################################################################
# Services

sudo systemctl stop         avahi-daemon.socket
sudo systemctl mask         avahi-daemon.socket
sudo systemctl stop         avahi-daemon.service
sudo systemctl mask         avahi-daemon.service

sudo systemctl stop         motd-news.timer
sudo systemctl disable      motd-news.timer
sudo systemctl stop         motd-news.service
sudo systemctl disable      motd-news.service

systemctl stop --user org.gnome.SettingsDaemon.Wacom.target
systemctl mask --user org.gnome.SettingsDaemon.Wacom.target
systemctl stop --user org.gnome.SettingsDaemon.Wacom.service
systemctl mask --user org.gnome.SettingsDaemon.Wacom.service




# ######################################################################
# ######################################################################
# Set up swap file

sudo swapoff /swapfile && \
	sudo rm /swapfile && \
	sudo fallocate -l 6g /swapfile && \
	sudo chmod 600 /swapfile && \
	sudo mkswap /swapfile && \
	sudo swapon /swapfile




# ######################################################################
# ######################################################################
# Packages

sudo apt remove --purge -y ghostscript*

sudo add-apt-repository -y -u ppa:git-core/ppa

sudo apt update

sudo apt-get install -y git gitk git-gui
sudo apt-get install -y ranger
sudo apt-get install -y doublecmd-gtk
sudo apt-get install -y synaptic
sudo apt-get install -y gthumb
sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y tree
sudo apt-get install -y docker-compose
