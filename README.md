# i3-config-files

This just contains everything I would need to set up a systemd boot, along with some info for arch install.


TIPS:
- install i3, its the best, maybe try worm again?
- use systemd-boot, fuck grub
- install nvidia-dkms and linux-headers, especially when using custom (like zen kernel), make sure to install headers
  - it only worked by uninstalling and reinstalling linux, after installing dkms
- use ly (yay -s ly) to manager the login
- starship for prompt
- make sure to install network manager, not iw it doesnt't work
