#!/bin/sh

sudo apt-get install lsb -y

# wget --append-output ~/Downloads/teste.log -P ~/Downloads https://download3.ebz.epson.net/dsc/f/03/00/03/45/41/58b06443ec2b00696f49aaef0ee0e3ea3c1354d2/epson-inkjet-printer-201401w_1.0.0-1lsb3.2_amd64.deb
wget -P ~/Downloads https://download3.ebz.epson.net/dsc/f/03/00/03/45/41/58b06443ec2b00696f49aaef0ee0e3ea3c1354d2/epson-inkjet-printer-201401w_1.0.0-1lsb3.2_amd64.deb
sudo dpkg -i ~/Downloads/epson-inkjet-printer-201401w_1.0.0-1lsb3.2_amd64.deb
rm -f ~/Downloads/epson-inkjet-printer-201401w_1.0.0-1lsb3.2_amd64.deb

# wget --append-output ~/Downloads/teste.log -P ~/Downloads https://download3.ebz.epson.net/dsc/f/03/00/12/97/40/6e8f72ada5fbc31c02ebb80ac66569e3975fd6b3/epson-printer-utility_1.1.1-1lsb3.2_amd64.deb
wget --directory-prefix ~/Downloads https://download3.ebz.epson.net/dsc/f/03/00/12/97/40/6e8f72ada5fbc31c02ebb80ac66569e3975fd6b3/epson-printer-utility_1.1.1-1lsb3.2_amd64.deb
sudo dpkg -i ~/Downloads/epson-printer-utility_1.1.1-1lsb3.2_amd64.deb
rm -f ~/Downloads/epson-printer-utility_1.1.1-1lsb3.2_amd64.deb

# install impressora EPSON L455
# docs
# wget: https://www.gnu.org/software/wget/manual/html_node/index.html#SEC_Contents
# dpkg: https://man7.org/linux/man-pages/man1/dpkg.1.html
# rm: https://man7.org/linux/man-pages/man1/rm.1.html