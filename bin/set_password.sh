#!/bin/bash

# Prompt for the MariaDB root password
read -s -p "Enter the MariaDB root password: " MARIADB_PASSWORD
echo

# Prompt for password confirmation
read -s -p "Confirm the MariaDB root password: " CONFIRM_PASSWORD
echo

# Check if passwords match
if [ "$MARIADB_PASSWORD" != "$CONFIRM_PASSWORD" ]; then
    echo "Passwords do not match. Please try again."
    exit 1
fi

export MARIADB_PASSWORD

