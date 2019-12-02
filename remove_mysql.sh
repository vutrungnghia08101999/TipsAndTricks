sudo apt-get remove --purge mysql*
echo "======================================================="
sudo apt-get purge mysql*
echo "======================================================="
sudo apt-get autoremove
echo "======================================================="
sudo apt-get autoclean
echo "======================================================="
sudo apt-get remove dbconfig-mysql
echo "======================================================="
sudo apt-get dist-upgrade
