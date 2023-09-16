#!/bin/bash

# Load the password from the environment variable
source "$(dirname "$0")/set_password.sh"

# Modify the SQL file to replace the placeholders with the actual values
sed -i "s/YourNewPasswordHere/$MARIADB_PASSWORD/" "$(dirname "$0")/sql/mariadb-setup.sql"
sed -i "s/YourUsernameHere/$DB_USERNAME/" "$(dirname "$0")/sql/mariadb-setup.sql"
sed -i "s/YourDatabaseNameHere/$DB_NAME/" "$(dirname "$0")/sql/mariadb-setup.sql"

# Remove any existing Maria DB install / Database
sudo systemctl stop mariadb
sudo systemctl disable mariadb
sudo apt remove mariadb-server mariadb-client -y
sudo apt purge mariadb-server mariadb-client -y
sudo rm -rf /etc/mysql/
sudo apt autoremove

# Installs new Maria DB
sudo apt update -y
sudo apt upgrade -y --assume-yes
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Run the SQL script with the password from the environment variable
sudo mysql -u root -p"$MARIADB_PASSWORD" < "$(dirname "$0")/sql/mariadb-setup.sql"

# Optional: Unset the environment variable after use
unset MARIADB_PASSWORD
unset DB_NAME
unset DB_USERNAME
