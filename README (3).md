# OSS Audit — Git
### Open Source Software Capstone Project | VIT Bhopal University

| Field | Details |
|-------|---------|
| **Student Name** | Kunjesh |
| **Course** | Open Source Software (OSS NGMC) |
| **Software Audited** | Git |
| **License** | GPL v2 |

---

## About This Project

This repository contains the shell scripts and supporting material for the Open Source Audit capstone project. The chosen software is **Git** — the distributed version control system created by Linus Torvalds in 2005, licensed under the GNU General Public License v2.

---

## Scripts

| Script | File | Description |
|--------|------|-------------|
| Script 1 | `script1_system_identity.sh` | Displays system info — distro, kernel, user, uptime, date, and OS license |
| Script 2 | `script2_package_inspector.sh` | Checks if Git is installed, shows version/license, uses a case statement for philosophy notes |
| Script 3 | `script3_disk_auditor.sh` | Loops through key system directories and reports permissions and disk usage |
| Script 4 | `script4_log_analyzer.sh` | Reads a log file line by line, counts keyword occurrences, prints last 5 matching lines |
| Script 5 | `script5_manifesto_generator.sh` | Interactively generates a personalised open source philosophy statement and saves it to a .txt file |

---

## How to Run

### Prerequisites
- A Linux system (Ubuntu, Debian, Fedora, or WSL on Windows)
- Git installed: `sudo apt install git` (Ubuntu/Debian) or `sudo dnf install git` (Fedora)
- Bash shell (default on all Linux systems)

### Steps

**1. Clone this repository**
```bash
git clone https://github.com/YOUR_USERNAME/oss-audit-ROLLNUMBER.git
cd oss-audit-ROLLNUMBER
```

**2. Make all scripts executable**
```bash
chmod +x *.sh
```

**3. Run Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**4. Run Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```

**5. Run Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_auditor.sh
```

**6. Run Script 4 — Log File Analyzer**
```bash
# Basic usage with default keyword 'error'
./script4_log_analyzer.sh /var/log/syslog

# With a custom keyword
./script4_log_analyzer.sh /var/log/syslog WARNING
```

**7. Run Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
# Follow the prompts — answer 3 questions
# Your manifesto will be saved as manifesto_USERNAME.txt
```

---

## Dependencies

| Dependency | Purpose | Install |
|------------|---------|---------|
| `bash` | Run all shell scripts | Pre-installed on Linux |
| `git` | Script 2 checks this package | `sudo apt install git` |
| `coreutils` | `du`, `ls`, `date`, `whoami` | Pre-installed on Linux |
| `grep` | Log file keyword search | Pre-installed on Linux |

---

## Notes for WSL (Windows Subsystem for Linux) Users

If you are running these scripts on WSL:
- Scripts work identically on WSL Ubuntu
- For Script 4, use `/var/log/dpkg.log` as a sample log file (WSL may not have `/var/log/syslog` populated)
- Run `sudo apt update` first to ensure all tools are available
