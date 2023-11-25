echo -ne "
-------------------------------------------------------------------------
                    Config time
-------------------------------------------------------------------------
"
timedatectl
timedatectl set-timezone Europe/Minsk
timedatectl set-ntp true