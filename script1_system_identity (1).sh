#!/bin/bash
# Script 1: System Identity Report
# Author: Student | Course: Open Source Software
# Description: Displays a welcome screen with system information

# --- Variables ---
STUDENT_NAME="Kunjesh"          # Student name
SOFTWARE_CHOICE="Git"           # Chosen open-source software

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                         # Linux kernel version
USER_NAME=$(whoami)                        # Currently logged-in user
HOME_DIR=$HOME                             # Home directory of the user
UPTIME=$(uptime -p)                        # Human-readable system uptime
CURRENT_DATE=$(date '+%d %B %Y %H:%M:%S') # Current date and time
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"') # Distro name

# --- Display the system identity report ---
echo "========================================================"
echo "        Open Source Audit — $STUDENT_NAME"
echo "        Software Under Audit: $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $CURRENT_DATE"
echo ""
echo "========================================================"

# --- License message for the OS ---
# Linux is licensed under GPL v2, which guarantees users the freedom
# to run, study, share, and modify the software.
echo "  OS License   : GPL v2 (GNU General Public License version 2)"
echo "  This means: You are FREE to use, study, modify, and share this OS."
echo "========================================================"
echo ""
echo "  Auditing: $SOFTWARE_CHOICE — Version Control System by Linus Torvalds"
echo "  License : GPL v2"
echo "  Website : https://git-scm.com"
echo ""
echo "========================================================"
