#!/bin/bash

# Define absolute paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$SCRIPT_DIR/bin"
BACKUP_DIR="$SCRIPT_DIR/backup/bin"

# Starts Maria DB Install
if [ -d "$BIN_DIR" ]; then
    cd "$BIN_DIR" || exit
    ./mariadb-setup.sh || { echo "Error: Failed to execute mariadb-setup.sh"; exit 1; }
else
    echo "Error: bin directory not found"
    exit 1
fi

# Removes All Plain Text Files with Newly Created Passwords
cd "$SCRIPT_DIR" || exit
rm -dr "$BIN_DIR"

# Restores Backed Up Default Maria DB Install Scripts
if [ -d "$BACKUP_DIR" ]; then
    cp -r "$BACKUP_DIR" "$SCRIPT_DIR"
else
    echo "Warning: Backup directory not found. No files restored."
fi

