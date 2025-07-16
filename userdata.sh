#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install wget -y
sudo apt install zip unzip -y
wget https://www.tooplate.com/download/2137_barista_cafe
mv 2137_barista_cafe 2137_barista_cafe.zip
unzip 2137_barista_cafe.zip
sudo mv 2137_barista_cafe/* /var/www/html/
sudo rm -rf 2137_barista_cafe
sudo rm 2137_barista_cafe.zip
sudo systemctl restart apache2
sudo systemctl enable apache2