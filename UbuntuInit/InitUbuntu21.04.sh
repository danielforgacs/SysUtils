# ######################################################################
# ######################################################################
# Backup original sys files

sudo cp /etc/fstab /etc/fstab.ORIGINAL
sudo cp /etc/default/grub /etc/default/grub.ORIGINAL
sudo cp /etc/adduser.conf /etc/adduser.conf.ORIGINAL
sudo cp /etc/sysctl.conf /etc/sysctl.conf.ORIGINAL
sudo cp /etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades.ORIGINAL

# check these, these are used to fetch some news on updates...

# doesn't exist:
# /etc/default/motd-news

# found:
# /etc/systemd/system/timers.target.wants/motd-news.timer
# /etc/update-motd.d/50-motd-news



# ######################################################################
# ######################################################################

# Set swappiness manually in "/etc/sysctl.conf"
# vm.swappiness=30

# check:
# $ cat /proc/sys/vm/swappiness



# ######################################################################
# ######################################################################
# Sys settings

sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub
sudo update-grub

# some unnecessary new update...
# sudo sed -i 's:Update-Package-Lists "1":Update-Package-Lists "0":g' /etc/apt/apt.conf.d/20auto-upgrades
# sudo sed -i 's:Unattended-Upgrade "1":Unattended-Upgrade "0":g' /etc/apt/apt.conf.d/20auto-upgrades

# New user dir permission settings... ! ubuntu defaults changed !
# sudo sed -i 's:DIR_MODE=0755:DIR_MODE=700:g' /etc/adduser.conf
# sudo sed -i "s:ENABLED=1:# ENABLED=0:g" /etc/default/motd-news
# sudo sed -i "s:URLS=\"https:# URLS=\"https:g" /etc/default/motd-news
