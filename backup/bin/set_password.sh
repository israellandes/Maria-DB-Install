#!/bin/bash

# Set DEBIAN_FRONTEND to noninteractive
export DEBIAN_FRONTEND=noninteractive

# Disable "Pending kernel upgrade" via command line
sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf

# Set restart configuration only if not already set
if ! grep -q "^\$nrconf{restart} = 'a';" /etc/needrestart/needrestart.conf; then
    sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
fi

passwords_match=false

while [ "$passwords_match" == false ]; do
    # Prompt for the MariaDB root password
    read -s -p "Enter the MariaDB root password: " MARIADB_PASSWORD
    echo

    # Prompt for password confirmation
    read -s -p "Confirm the MariaDB root password: " CONFIRM_PASSWORD
    echo

    # Check if passwords match
    if [ "$MARIADB_PASSWORD" == "$CONFIRM_PASSWORD" ]; then
        passwords_match=true
    else
        echo "Passwords do not match. Please try again."
    fi
done

# Prompt for the database name
read -p "Enter the database name: " DB_NAME

# Prompt for the username
read -p "Enter the username: " DB_USERNAME

export MARIADB_PASSWORD
export DB_NAME
export DB_USERNAME

