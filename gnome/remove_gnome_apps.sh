GNOME_PATH=/usr/share/applications

declare -a arr=(
   "nm-connection-editor.desktop"
   "org.gnome.Extensions.desktop"
   "htop.desktop"
   "cups.desktop"
   "mupdf.desktop"
   "Gentoo-system-config-printer.desktop"
)

for i in "${arr[@]}"
do
   sudo rm $GNOME_PATH/$i
   echo "removed: $GNOME_PATH/$i"
done
