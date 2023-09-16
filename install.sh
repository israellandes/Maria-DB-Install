#!/bin/bash

# Starts Maria DB Install
./bin/mariadb-setup.sh

# Removes All Plain Text Files with Newly Cteated Passwords
rm -dr ./bin

# Restores Backed Up Default Maria DB Install Scripts
mv ./backup/bin ./bin
