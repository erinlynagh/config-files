echo "activating system services..."
sudo systemctl enable --now systemd-networkd.service
sudo systemctl enable --now NetworkManager.service
systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now bing-wallpaper-daily.service
systemctl --user enable --now bing-wallpaper-daily.timer
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now ly.service
sudo systemctl enable --now thermald.service
sudo systemctl enable --now systemd-timesyncd.service
