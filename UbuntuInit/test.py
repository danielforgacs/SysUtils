import os
import sys
import subprocess


error = lambda msg: sys.stderr.write('[ERROR] '+msg+'\n')


#  Check for copied system files.
SYSFILES = [
    '/etc/fstab.ORIGINAL',
    '/etc/default/grub.ORIGINAL',
    '/etc/adduser.conf.ORIGINAL',
    '/etc/sysctl.conf.ORIGINAL',
    '/etc/apt/apt.conf.d/20auto-upgrades.ORIGINAL',
]
for path_ in SYSFILES:
    if not os.path.isdir(path_):
        error('missing sys file: '+path_)


# Check swappiness
EXPECTEDSWAPPINESS = '30'
swappinesscheck = subprocess.run(['cat', '/proc/sys/vm/swappiness'], capture_output=True)
swappinessnum = swappinesscheck.stdout.decode().strip()
if swappinessnum != EXPECTEDSWAPPINESS:
    error('swappiness is not '+swappinessnum)


# Check boot without splash screen.
GRUBFILE = '/etc/default/grub'
SPLASHSCREENMARKER = 'quiet splash'
with open(GRUBFILE, 'r') as filestream:
    grubconfig = filestream.read()
if SPLASHSCREENMARKER in grubconfig:
    error('boot splash screen is not turned off in grub config')


# Services
SERVICES = [
    [' ', 'motd-news.service'],
    [' ', 'motd-news.timer'],
    [' ', 'snapd.service'],
    [' ', 'snapd.socket'],
    [' ', 'avahi-daemon.service'],
    [' ', 'avahi-daemon.socket'],
    ['--user', 'gsd-wacom.target'],
    ['--user', 'gsd-print-notifications.target'],
]
for service in SERVICES:
    response = subprocess.run(['systemctl', 'status']+ service, capture_output=True)
    output = response.stdout.decode()
    if 'Active: inactive' not in output:
        error('service is running: '+service[1])
