echo -ne "
-------------------------------------------------------------------------
                    GRUB BIOS Bootloader Install & Check
-------------------------------------------------------------------------
"
vim /etc/default/grub # Расскоментировать строку OS_PROBER
os-prober
grub-mkconfig -o /boot/grub/grub.cfg