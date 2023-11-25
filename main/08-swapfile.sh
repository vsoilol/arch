# Put swap into the actual system, not into RAM disk, otherwise there is no point in it, it'll cache RAM into RAM. So, /mnt/ everything.
mkdir -p /mnt/opt/swap # make a dir that we can apply NOCOW to to make it btrfs-friendly.
chattr +C /mnt/opt/swap # apply NOCOW, btrfs needs that.
dd if=/dev/zero of=/mnt/opt/swap/swapfile bs=1M count=8192 status=progress
chmod 600 /mnt/opt/swap/swapfile # set permissions.
chown root /mnt/opt/swap/swapfile
mkswap /mnt/opt/swap/swapfile
swapon /mnt/opt/swap/swapfile
# The line below is written to /mnt/ but doesn't contain /mnt/, since it's just / for the system itself.
echo "/opt/swap/swapfile	none	swap	sw	0	0" >> /mnt/etc/fstab # Add swap to fstab, so it KEEPS working after installation.