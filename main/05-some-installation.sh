echo -ne "
-------------------------------------------------------------------------
                    Installing Prerequisites
-------------------------------------------------------------------------
"
pacman -S --noconfirm --needed gptfdisk btrfs-progs glibc
echo -ne "