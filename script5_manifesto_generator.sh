#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Kunjesh Mahajan | Roll: 24BEY10156 | Slot: B22
# Course: Open Source Software | Submission: 31 March 2026
# Description: Interactively generates a personalised open source philosophy statement
#              and saves it to a .txt file

# --- Alias concept demonstrated via comment ---
# In a real session you could define: alias manifest='bash script5_manifesto_generator.sh'
# Aliases allow shortening repeated commands, just as open source shortens the path to tools.

echo "========================================================"
echo "      Open Source Manifesto Generator"
echo "========================================================"
echo ""
echo "  Answer three questions to generate your personal manifesto."
echo ""

# --- Read user input interactively ---
read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""

# --- Get current date for the manifesto header ---
DATE=$(date '+%d %B %Y')

# --- Output file named after the current user ---
OUTPUT="manifesto_$(whoami).txt"

# --- String concatenation: compose the manifesto paragraph ---
LINE1="Open Source Manifesto — Generated on $DATE"
LINE2="By: $(whoami)"
LINE3=""
LINE4="Every day, I rely on $TOOL — a tool I did not pay for, did not build alone,"
LINE5="and do not own exclusively. It belongs to everyone. That is the power of open source."
LINE6=""
LINE7="To me, freedom means $FREEDOM. In the world of software, that freedom is not given —"
LINE8="it is built into the license, protected by the community, and extended with every"
LINE9="contribution. GPL, MIT, Apache — these are not just legal texts. They are promises."
LINE10=""
LINE11="I believe knowledge should flow freely. That is why, given the chance, I would build"
LINE12="$BUILD and release it openly — so that someone I will never meet can learn from it,"
LINE13="improve it, and pass it on. Just as others did for me."
LINE14=""
LINE15="Open source is not charity. It is civilization's best model for collaborative progress."

# --- Write the manifesto to the output file using > and >> ---
echo "$LINE1"  > "$OUTPUT"    # Create/overwrite file with first line
echo "$LINE2" >> "$OUTPUT"    # Append remaining lines
echo "$LINE3" >> "$OUTPUT"
echo "$LINE4" >> "$OUTPUT"
echo "$LINE5" >> "$OUTPUT"
echo "$LINE6" >> "$OUTPUT"
echo "$LINE7" >> "$OUTPUT"
echo "$LINE8" >> "$OUTPUT"
echo "$LINE9" >> "$OUTPUT"
echo "$LINE10" >> "$OUTPUT"
echo "$LINE11" >> "$OUTPUT"
echo "$LINE12" >> "$OUTPUT"
echo "$LINE13" >> "$OUTPUT"
echo "$LINE14" >> "$OUTPUT"
echo "$LINE15" >> "$OUTPUT"

echo "========================================================"
echo "  [SUCCESS] Manifesto saved to: $OUTPUT"
echo "========================================================"
echo ""

# --- Display the generated manifesto ---
cat "$OUTPUT"

echo ""
echo "========================================================"
