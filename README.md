# config-files

## Restoring the Backup

run /scripts/createBackup.sh to update backup
run /scripts/restoreBackup.sh to restore from backup

the backup can be configured with the two files in /scripts/backupSettings/; they tell the backup script which files and folders to backup (and restore)


## Other Tips
- try i3 or awesome
	- maybe try worm or berry one day
- use systemd-boot
- install nvidia-dkms and linux-headers when using custom kernels
  - it only worked by uninstalling and reinstalling linux, after installing dkms
- try to keep the backup up to date for easy installing later
- pacui has a nice mirrorlist built into it

## Working with the Package List

restore only non-foreign packages:
```pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.txt))```

delete packages that arent in the package list:
```pacman -Rsu $(comm -23 <(pacman -Qq | sort) <(sort packages.txt))```

## TODO
- create a service to run the backup script periodically
