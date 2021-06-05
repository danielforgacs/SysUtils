# ######################################################################
# ######################################################################
# Backup original sys files

sudo cp /etc/fstab /etc/fstab.ORIGINAL
sudo cp /etc/default/grub /etc/default/grub.ORIGINAL
sudo cp /etc/adduser.conf /etc/adduser.conf.ORIGINAL
sudo cp /etc/sysctl.conf /etc/sysctl.conf.ORIGINAL
sudo cp /etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades.ORIGINAL

# check these:

# doesn't exist:
# /etc/default/motd-news

# found:
# /etc/systemd/system/timers.target.wants/motd-news.timer
# /etc/update-motd.d/50-motd-news



# ######################################################################
# ######################################################################

# Set swappiness manually in "/etc/sysctl.conf"
# vm.swappiness=30



# ######################################################################
# ######################################################################
# Sys settings

sudo sed -i 's:GRUB_CMDLINE_LINUX_DEFAULT="quiet splash":GRUB_CMDLINE_LINUX_DEFAULT="":g' /etc/default/grub && sudo update-grub
