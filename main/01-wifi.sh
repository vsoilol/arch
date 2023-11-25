echo -ne "
-------------------------------------------------------------------------
                    WI-FI configuration
-------------------------------------------------------------------------
"
lspci -k
rfkill list
rfkill unblock wifi
ip link set {интерфейс} up
iwctl
device list
station {интерфейс} scan
station {интерфейс} connect 17