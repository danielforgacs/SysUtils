import os
import sys
import subprocess


error = lambda msg: sys.stderr.write('[ERROR] '+msg+'\n')


#  Check for copied system files.
homedir = os.path.expanduser('~/OriginalSysFiles/')
SYSFILES = [
    homedir+'fstab',
    homedir+'grub',
    homedir+'adduser.conf',
    homedir+'sysctl.conf',
    homedir+'20auto-upgrades',
]
for path_ in SYSFILES:
    if not os.path.isfile(path_):
        error('missing backup: '+path_)




# Check swappiness
EXPECTEDSWAPPINESS = '30'
swappinesscheck = subprocess.run(['cat', '/proc/sys/vm/swappiness'], capture_output=True)
swappinessnum = swappinesscheck.stdout.decode().strip()
if swappinessnum != EXPECTEDSWAPPINESS:
    error('swappiness is: '+swappinessnum+'; expected: '+EXPECTEDSWAPPINESS)




# Check boot without splash screen.
GRUBFILE = '/etc/default/grub'
SPLASHSCREENMARKER = 'quiet splash'
with open(GRUBFILE, 'r') as filestream:
    grubconfig = filestream.read()
if SPLASHSCREENMARKER in grubconfig:
    error('boot splash screen is not turned off in grub config')




# Services
SERVICES = [
    [' ', 'avahi-daemon.service'],
    [' ', 'avahi-daemon.socket'],
    [' ', 'motd-news.service'],
    [' ', 'motd-news.timer'],
                # [' ', 'snapd.service'],
                # [' ', 'snapd.socket'],
                # ['--user', 'gsd-wacom.target'],
                # ['--user', 'gsd-print-notifications.target'],
    ['--user', 'org.gnome.SettingsDaemon.Wacom.target'],
    ['--user', 'org.gnome.SettingsDaemon.Wacom.service'],
]
for service in SERVICES:
    response = subprocess.run(['systemctl', 'status']+ service, capture_output=True)
    output = response.stdout.decode()
    if 'Active: inactive' not in output:
        error('service is running: '+service[1])




# Swap file
SWAPFILE = '/swapfile'
expectedsize_min = 6 * 1024 * 1024 * 1024
if os.stat(SWAPFILE).st_size < expectedsize_min:
    error('swapfile is smaller than: '+str(expectedsize_min))




# gsettings checks
response = subprocess.run(['gsettings', 'get', 'org.gnome.shell.extensions.dash-to-dock', 'show-mounts'], capture_output=True)
output = response.stdout.decode().strip()
if output != 'false':
    error('Mounted disks show up on the dock')




# Check apt repositories:
REPOS = [
    'git-core',
]
for repo in REPOS:
    response = subprocess.run(['apt-add-repository', '--list'], capture_output=True)
    output = response.stdout.decode().strip()
    if repo not in output:
        error('Apt repo not added: '+repo)




# checking packages
INSTALLED_PACKAGES = [
    'ghostscript*',
]
for package in INSTALLED_PACKAGES:
    response = subprocess.run(['apt', 'list', '--installed', package], capture_output=True)
    output = response.stdout.decode().strip()
    if output != 'Listing...':
        error('package is installed: '+package)

MISSING_PACKAGES = [
    'git',
    'git-gui',
    'gitk',
    'ranger',
    'doublecmd*',
    'synaptic',
    'dconf-editor',
    'baobab',
    'gthumb',
    'gnome-tweaks',
    'curl',
    'vim',
    'tree',
    'docker-compose',
]
for package in MISSING_PACKAGES:
    response = subprocess.run(['apt', 'list', '--installed', package], capture_output=True)
    output = response.stdout.decode().strip()
    if output == 'Listing...':
        error('package is missing: '+package)
