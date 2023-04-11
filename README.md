# config-files

## Restoring the Backup

### packages

#### install yay

pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

#### restore only non-foriegn packages

pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.txt))

#### restore everything including foreign

yay -S --needed - < packages.txt

#### delete packages that arent in the backup

pacman -Rsu $(comm -23 <(pacman -Qq | sort) <(sort packages.txt))

### config files

config/ --> ~./.config/
sudo cp dcss.desktop /usr/share/applications/dcss.desktop
cp xinitrc ~/.xinitrc
etc/ --> /etc/
screenlayout/ --> ~/.screenlayout/
systemd-boot/ --> /boot/loader/

- probably dont do this one just reference it
  dcss-config/ --> ~/.crawl/

This just contains everything I would need to set up an arch install w systemd boot, along with some info for arch install. Just follow the wiki, should be able to basically just copy and paste these in. The boot files are good examples.

TIPS:

- when you're installing use e2label (or the command for the specific volume type) to label the drives. It makes mounting easier and makes the systemd boot files easier to configure.
- install i3, its the best, maybe try worm or berry again?
- use systemd-boot, fuck grub
- install nvidia-dkms and linux-headers, especially when using custom (like zen kernel), make sure to install headers
  - it only worked by uninstalling and reinstalling linux, after installing dkms
  - linux zen might not be worth it, probably skip custom kernel unless theres something more exciting
- use ly (yay -s ly) to manager the login
- starship for prompt
- make sure to install network manager, not iw it doesnt't work

systemctl enable --now systemd-timesyncd.service ## sets time to sync to a network


### dcss
 just copy the dcss.sh to /home/erin/ and place the desktop files in /usr/share/applications
 it backs up morgue files so make sure the backup location exists
