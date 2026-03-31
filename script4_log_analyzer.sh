#!/bin/bash
# Script 4: Log File Analyzer
# Author: Student | Course: Open Source Software
# Description: Reads a log file, counts keyword occurrences, shows matching lines
# Usage: ./script4_log_analyzer.sh /path/to/logfile [KEYWORD]

# --- Accept log file path and optional keyword from command-line arguments ---
LOGFILE=$1               # First argument: path to the log file
KEYWORD=${2:-"error"}    # Second argument: keyword to search (default: "error")
COUNT=0                  # Counter variable to track keyword matches

echo "========================================================"
echo "         Log File Analyzer"
echo "========================================================"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "[ERROR] No log file specified."
    echo "  Usage: ./script4_log_analyzer.sh /var/log/syslog [KEYWORD]"
    exit 1
fi

# --- Check if the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "[ERROR] File '$LOGFILE' not found."

    # --- Do-while style retry: suggest an alternative log file ---
    RETRIES=0
    MAX_RETRIES=3
    FOUND=0

    # Try common log file locations as fallback
    for FALLBACK in /var/log/syslog /var/log/messages /var/log/kern.log; do
        RETRIES=$((RETRIES + 1))
        echo "  [Retry $RETRIES/$MAX_RETRIES] Checking: $FALLBACK ..."
        if [ -f "$FALLBACK" ]; then
            echo "  [FOUND] Using fallback log: $FALLBACK"
            LOGFILE=$FALLBACK
            FOUND=1
            break
        fi
        [ $RETRIES -ge $MAX_RETRIES ] && break
    done

    # If no fallback found, exit gracefully
    if [ $FOUND -eq 0 ]; then
        echo "  [ERROR] No suitable log file found. Exiting."
        exit 1
    fi
fi

# --- Check if log file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "[WARNING] Log file '$LOGFILE' is empty. Nothing to analyze."
    exit 0
fi

echo "  Analyzing : $LOGFILE"
echo "  Keyword   : '$KEYWORD'"
echo ""

# --- While-read loop: read log file line by line ---
while IFS= read -r LINE; do
    # If-then: check if the current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter for each match
    fi
done < "$LOGFILE"

# --- Print summary ---
echo "  Result: Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Print last 5 matching lines using grep and tail ---
echo "--- Last 5 lines containing '$KEYWORD' ---"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo ""
echo "========================================================"
echo "  Tip: Run with different keywords e.g. WARNING, FAILED, SUCCESS"
echo "========================================================"
