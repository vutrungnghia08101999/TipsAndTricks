CWD=$(pwd)
if [ "$CWD" != "/usr/src" ]; then
  echo "invalid directory, current working directory must be: /usr/src"
  exit 1
fi


TMP=$(eselect kernel show)
linux_current_version=${TMP##*/}
boot_parttion=$1
new_version=$2
linux_new_version="linux-$new_version"

echo "$linux_current_version => $linux_new_version"
cd $linux_new_version
echo $(pwd)

if mount | grep $boot_parttion > "/dev/null"; then
    echo "Already mount boot partion"
else
    mount $boot_parttion /boot
    echo "mounted $boot_parttion at: /boot"
fi


if [ "$linux_current_version" = "$linux_new_version" ]; then
    echo "Update current kernel: $linux_current_version, skip updating boot loader"
    make && make modules_install
    make install
    path="/boot/config-$new_version"
    genkernel --install --kernel-config=$path initramfs
    echo "Completed updating: $linux_current_version => $linux_new_version"
    exit 0
fi

echo "Update kernel: $linux_current_version => $linux_new_version"
make && make modules_install
make install
path="/boot/config-$new_version"
genkernel --install --kernel-config=$path initramfs
grub-mkconfig -o /boot/grub/grub.cfg
echo "Completed updating: $linux_current_version => $linux_new_version"
exit 0

