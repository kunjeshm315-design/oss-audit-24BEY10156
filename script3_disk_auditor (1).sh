#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Kunjesh Mahajan | Roll: 24BEY10156 | Slot: B22
# Course: Open Source Software | Submission: 31 March 2026
# Description: Loops through key system directories and reports permissions and disk usage

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================================"
echo "         Disk and Permission Auditor"
echo "========================================================"
echo ""
echo "Directory Audit Report"
echo "----------------------"

# --- For loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory exists before auditing it
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')   # Permission string e.g. drwxr-xr-x
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')   # Owner username
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')   # Group name
        # Get directory size; suppress errors for permission-denied subdirs
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "  Directory : $DIR"
        echo "  Permissions: $PERMS | Owner: $OWNER | Group: $GROUP | Size: $SIZE"
        echo "  ---"
    else
        # Directory does not exist on this system
        echo "  $DIR => does NOT exist on this system"
        echo "  ---"
    fi
done

echo ""
echo "--- Git Config Directory Check ---"

# --- Check if Git's config directory exists and print its permissions ---
# Git stores its system-wide config at /etc/gitconfig
# User-level config is at ~/.gitconfig
GIT_SYSTEM_CONFIG="/etc/gitconfig"
GIT_USER_CONFIG="$HOME/.gitconfig"
GIT_USER_DIR="$HOME/.git"

# Check system config
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    SYS_PERMS=$(ls -l "$GIT_SYSTEM_CONFIG" | awk '{print $1, $3, $4}')
    echo "  [FOUND] System Git config: $GIT_SYSTEM_CONFIG"
    echo "  Permissions: $SYS_PERMS"
else
    echo "  [INFO] No system-wide git config found at $GIT_SYSTEM_CONFIG"
fi

# Check user config
if [ -f "$GIT_USER_CONFIG" ]; then
    USR_PERMS=$(ls -l "$GIT_USER_CONFIG" | awk '{print $1, $3, $4}')
    echo "  [FOUND] User Git config: $GIT_USER_CONFIG"
    echo "  Permissions: $USR_PERMS"
else
    echo "  [INFO] No user git config found at $GIT_USER_CONFIG"
    echo "  Run 'git config --global user.name' to create one."
fi

echo ""
echo "========================================================"
echo "  Note: Git binary is located at: $(which git 2>/dev/null || echo 'not found')"
echo "========================================================"
