#!/bin/bash

# Colors
NC='\033[0m'        # No Color
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

# System information
echo -e "${BLUE}System Information${NC}"
echo "===================="
echo -e "${GREEN}Hostname:${NC}    $(hostname)"
echo -e "${GREEN}Uptime:${NC}      $(uptime -p)"
echo -e "${GREEN}Kernel:${NC}      $(uname -r)"
echo -e "${GREEN}Memory:${NC}      $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo -e "${GREEN}CPU Load:${NC}    $(cat /proc/loadavg | awk '{print $1, $2, $3}')"
echo -e "${GREEN}Disk Usage:${NC}  $(df -h / | awk 'NR==2 {print $5 " (" $3 "/" $2 ")"}')"
echo -e "${GREEN}IP Address:${NC}  $(hostname -I | awk '{print $1}')"

# Check for system updates (Debian/Ubuntu)
if command -v apt > /dev/null; then
    UPDATES=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
    if [ "$UPDATES" -gt 0 ]; then
        echo -e "\n${YELLOW}System Updates: $UPDATES updates available${NC}"
    fi
fi

echo -e "\n"
