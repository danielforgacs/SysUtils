# ##########
# Backup original sys files
# ##########
sudo cp /etc/fstab /etc/fstab.ORIGINAL
sudo cp /etc/default/grub /etc/default/grub.ORIGINAL
sudo cp /etc/adduser.conf /etc/adduser.conf.ORIGINAL
sudo cp /etc/sysctl.conf /etc/sysctl.conf.ORIGINAL
sudo cp /etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades.ORIGINAL

# check these:
# doesn't exist:
# sudo cp /etc/default/motd-news /etc/default/motd-news.ORIGINAL
# found:
# /etc/systemd/system/timers.target.wants/motd-news.timer
# /etc/update-motd.d/50-motd-news
