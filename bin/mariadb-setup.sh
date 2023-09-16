#!/bin/bash

# Load the password from the environment variable
source ./bin/set_password.sh

# Modify the SQL file to replace the placeholder with the password
sed -i "s/YourNewPasswordHere/$MARIADB_PASSWORD/" ./bin/sql/mariadb_setup.sql

# Remove any existing Maria DB install / Database
sudo apt remove mariadb-server mariadb-client -y

# Installs new Maria DB
sudo apt -y update && sudo apt -y upgrade
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Run the SQL script with the password from the environment variable
sudo mysql -u root -p"$MARIADB_PASSWORD" < ./bin/sql/mariadb_setup.sql

# Optional: Unset the environment variable after use
unset MARIADB_PASSWORD

