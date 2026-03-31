#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Student | Course: Open Source Software
# Description: Checks if a package is installed and prints its details

# --- Package to inspect ---
PACKAGE="git"   # Our chosen open-source software

echo "========================================================"
echo "         FOSS Package Inspector"
echo "========================================================"
echo ""

# --- Check if the package is installed using if-then-else ---
# dpkg is used on Debian/Ubuntu systems
# rpm is used on RedHat/Fedora/CentOS systems
if command -v dpkg &>/dev/null; then
    # Debian/Ubuntu based system
    if dpkg -l "$PACKAGE" &>/dev/null; then
        echo "[INFO] $PACKAGE is INSTALLED on this system."
        echo ""
        echo "--- Package Details ---"
        # Use pipe with grep to filter relevant fields
        dpkg -l "$PACKAGE" | grep -v "^|" | grep -v "^+" | grep "^ii"
        echo ""
        # Get version info
        VERSION=$(git --version 2>/dev/null | awk '{print $3}')
        echo "  Version : $VERSION"
        echo "  License : GPL v2"
        echo "  Summary : Fast, distributed version control system"
    else
        echo "[WARNING] $PACKAGE is NOT installed on this system."
        echo "  Install with: sudo apt install git"
    fi
elif command -v rpm &>/dev/null; then
    # RedHat/Fedora/CentOS based system
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "[INFO] $PACKAGE is INSTALLED on this system."
        echo ""
        echo "--- Package Details ---"
        # Use pipe with grep to filter relevant fields
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "[WARNING] $PACKAGE is NOT installed on this system."
        echo "  Install with: sudo dnf install git"
    fi
else
    # Fallback: try using the binary directly
    if command -v git &>/dev/null; then
        echo "[INFO] $PACKAGE is INSTALLED on this system."
        VERSION=$(git --version | awk '{print $3}')
        echo "  Version : $VERSION"
    else
        echo "[WARNING] $PACKAGE is NOT installed on this system."
    fi
fi

echo ""
echo "--- Open Source Philosophy Notes ---"

# --- Case statement: print philosophy note based on package name ---
case $PACKAGE in
    git)
        echo "Git: Born out of necessity when Linus Torvalds rejected all proprietary"
        echo "     VCS tools. He built Git in just 2 weeks — free, fast, and forever open."
        ;;
    httpd|apache2)
        echo "Apache: The web server that built the open internet — powers millions of sites."
        ;;
    mysql)
        echo "MySQL: Open source at the heart of millions of apps — a dual-license story."
        ;;
    python3|python)
        echo "Python: Shaped entirely by community — the PSF ensures it stays free forever."
        ;;
    vlc)
        echo "VLC: Built by students in Paris — plays anything, runs everywhere, costs nothing."
        ;;
    firefox)
        echo "Firefox: A nonprofit fighting for an open, private, and accessible web."
        ;;
    libreoffice)
        echo "LibreOffice: Born from a community fork — proof that users can take back control."
        ;;
    *)
        echo "$PACKAGE: An open-source tool contributing to the free software ecosystem."
        ;;
esac

echo ""
echo "========================================================"
