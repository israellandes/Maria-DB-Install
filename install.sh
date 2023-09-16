#!/bin/bash

# Starts Maria DB Install
cd ./bin && ./mariadb-setup.sh

# Removes All Plain Text Files with Newly Cteated Passwords
cd .. && rm -dr ./bin

# Restores Backed Up Default Maria DB Install Scripts
cp -r ./backup/bin ./
