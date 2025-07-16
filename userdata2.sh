#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install wget -y
sudo apt install zip unzip -y
wget https://www.tooplate.com/download/2110_character
mv 2110_character 2110_character.zip
unzip 2110_character.zip
sudo mv 2110_character/* /var/www/html/
sudo rm -rf 2110_character
sudo rm 2110_character.zip
sudo systemctl restart apache2
sudo systemctl enable apache2