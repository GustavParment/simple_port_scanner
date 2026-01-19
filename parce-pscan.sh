#!/bin/bash

# Clear terminal for a professional look
clear

# Define Colors
BLUE='\e[1;34m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
RED='\e[1;31m'
NC='\e[0m' # No Color

# Display the ASCII Banner
printf "${BLUE}"
cat << "EOF"
  _____                              _____   _____                      
 |  __ \                            |  __ \ / ____|                     
 | |__) |_ _ _ __ ___ ___  ___      | |__) | (___   ___ __ _ _ __  _ __ 
 |  ___/ _` | '__/ __/ _ \/ __|     |  ___/ \___ \ / __/ _` | '_ \| '__|
 | |  | (_| | | | (_|  __/\__ \     | |     ____) | (_| (_| | | | | |   
 |_|   \__,_|_|  \___\___||___/     |_|    |_____/ \___\__,_|_| |_|_|   
                                                                        
       >>> Parces Port Scanner - made by ParceSnarce <<<
EOF
printf "${NC}\n"

error_exit() {
    printf "${RED}❌ Error: $1${NC}\n"
    exit 1
}

# Check if a target was provided
if [ -z "$1" ]; then
    printf "${YELLOW}Usage: parce-pscan <target>${NC}\n"
    exit 1
fi

PYTHON_SCRIPT="/usr/local/share/parce-pscan/port_scanner.py"

# 1. Start Tor
printf "${YELLOW}[*] Starting Tor service...${NC}\n"
sudo systemctl start tor || error_exit "Failed to start Tor service."

# 2. Verify Tor
if ! systemctl is-active --quiet tor; then
    error_exit "Tor service is not running correctly."
fi

# 3. Launch the scanner via Proxychains
printf "${GREEN}[*] Routing traffic through Proxychains (Tor)...${NC}\n"
# -q hides the proxy connection logs for a cleaner output
proxychains -q python3 "$PYTHON_SCRIPT" "$1"

# Capture the exit code of the Python script
RESULT=$?

if [ $RESULT -eq 0 ]; then
    printf "${GREEN}✅ Scan completed successfully.${NC}\n"
else
    printf "${RED}⚠️ Scan encountered an issue.${NC}\n"
fi

exit 0





































































    echo "❌ Error: $1"
    exit 1
}

echo "--- Port Scanner Wrapper ---"

# Check if the Python script exists in the SHARED folder (Professional Way)
PYTHON_SCRIPT="/usr/local/share/parce-pscan/port_scanner.py"

if [ ! -f "$PYTHON_SCRIPT" ]; then
    error_exit "Python script not found at $PYTHON_SCRIPT. Did you move it?"
fi

# 1. Start Tor
echo "[*] Starting Tor service..."
sudo systemctl start tor

if [ $? -ne 0 ]; then
    error_exit "Failed to start Tor service. Check your sudo permissions."
fi

# 2. Verify Tor
echo "[*] Verifying Tor status..."
if ! systemctl is-active --quiet tor; then
    error_exit "Tor service is not running correctly."
fi

# 3. Launch the scanner
echo "[*] Launching proxychains..."
proxychains python3 "$PYTHON_SCRIPT"

# 4. Final check
if [ $? -eq 0 ]; then
    echo "✅ Scan completed successfully."
else
    echo "⚠️ Scan failed or was interrupted."
fi
