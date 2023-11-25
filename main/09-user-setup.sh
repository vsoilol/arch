arch-chroot /mnt

vim /etc/locale.gen # (расскоментировать ru и en)
locale-gen
vim /etc/hostname # (вводим gayclub)
vim /etc/hosts
   # 127.0.0.1    localhost
   # ::1          localhost
   # 127.0.1.1    gayclub.localdomain    gayclub
  
passwd
useradd -m dungeonmaster
passwd dungeonmaster
usermod -aG wheel,audio,video,storage,scanner dungeonmaster