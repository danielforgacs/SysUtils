## pihole config

port `53` is used by some stub... by the service/daemon:
check status:

```
$ systemctl status systemd-resolved.service
```

this stuff has config files: `/etc/systemd/resolved.conf`

this can be just disabled in most cases, but not always...
read at the pihole repo readme, under the ubuntu section.

[pihole docker](https://github.com/pi-hole/docker-pi-hole)

check if it works & running:
```
$ dig @127.0.0.1 -p 53 google.com
```
