VERSION=$1
SRC=/usr/src
BOOT_PARTITION=/dev/nvme0n1p1
BOOT_MOUNT_POINT=/boot

KERNEL_JAR=linux-$1.tar.xz
KERNEL_VERSION=linux-$VERSION

tmp=(${VERSION//./ })
if [[ ${#tmp[@]} = 2 ]]; then
    KERNEL_CONFIG=config-$VERSION.0
else
    KERNEL_CONFIG=config-$VERSION
fi

echo "Version: $VERSION"
echo "SRC: $SRC"
echo "Boot partition: $BOOT_PARTITION"
echo "Boot mount point: $BOOT_MOUNT_POINT"
echo "Kernel jar: $KERNEL_JAR"
echo "Kernel version: $KERNEL_VERSION"
echo "Kernel config: $KERNEL_CONFIG"

if [[ $(findmnt -M "$BOOT_MOUNT_POINT") ]]; then
    echo "Boot partition has already been mount, skip"
else
    echo "Boot partition has not been mount"
    echo "Mount $BOOT_PARTITION at $BOOT_MOUNT_POINT"
    read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] ]] || exit 1
    sudo mount $BOOT_PARTITION $BOOT_MOUNT_POINT
    echo "Successfully mount $BOOT_PARTITION at $BOOT_MOUNT_POINT"
fi

sudo cp $KERNEL_JAR $SRC/ && sudo rm $KERNEL_JAR && cd $SRC
sudo tar xpvf $KERNEL_JAR && sudo rm $KERNEL_JAR
sudo cp $SRC/linux/.config $SRC/$KERNEL_VERSION/
cd $KERNEL_VERSION
sudo make oldconfig
sudo eselect kernel set $KERNEL_VERSION
sudo make -j8 && sudo make -j8 modules_install && sudo make install
sudo genkernel --install --kernel-config=$BOOT_MOUNT_POINT/$KERNEL_CONFIG initramfs
sudo eclean-kernel -n 2
