echo -ne "
-------------------------------------------------------------------------
                    Formating Disk
-------------------------------------------------------------------------
"
umount -A --recursive /mnt # make sure everything is unmounted before we start
cfdisk /dev/nvme0n1 # create partition one partition for EFI System 500M and one more for linux

mkfs.vfat -F32 -n "EFIBOOT" {EFI partition}
mkfs.btrfs -L ROOT {Linux partition} -f
mount -t btrfs {Linux partition} /mnt

MOUNT_OPTIONS='rw,noatime,compress=zstd:2,space_cache=v2,discard=async,ssd'

# create nonroot subvolumes
    btrfs subvolume create /mnt/@
    btrfs subvolume create /mnt/@home
    btrfs subvolume create /mnt/@var
    btrfs subvolume create /mnt/@tmp
    btrfs subvolume create /mnt/@.snapshots     
# unmount root to remount with subvolume 
    umount /mnt
# mount @ subvolume
    mount -o ${MOUNT_OPTIONS},subvol=@ {Linux partition} /mnt
# make directories home, .snapshots, var, tmp
    mkdir -p /mnt/{home,var,tmp,.snapshots}
# mount subvolumes
    mount -o ${MOUNT_OPTIONS},subvol=@home {Linux partition} /mnt/home
    mount -o ${MOUNT_OPTIONS},subvol=@tmp {Linux partition} /mnt/tmp
    mount -o ${MOUNT_OPTIONS},subvol=@var {Linux partition} /mnt/var
    mount -o ${MOUNT_OPTIONS},subvol=@.snapshots {Linux partition} /mnt/.snapshots

# mount target
mkdir -p /mnt/boot/efi
mount -t vfat -L EFIBOOT /mnt/boot/

