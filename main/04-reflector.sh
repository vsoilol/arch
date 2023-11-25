echo -ne "
-------------------------------------------------------------------------
                    Setting up $iso mirrors for faster downloads
-------------------------------------------------------------------------
"
iso=$(curl -4 ifconfig.co/country-iso)
reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
mkdir /mnt &>/dev/null # Hiding error message if any
pacman -Syy
vim /etc/pacman.conf # Uncomment options ParallelDownload=10 and add ILoveCandy and also uncomment Color