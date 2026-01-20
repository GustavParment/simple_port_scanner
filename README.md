Markdown

# 🛡️ Parce-PScan: Anonymous Threaded Port Scanner

Created by **ParceSnarce**

`Parce-PScan` is a lightweight, high-performance port scanner written in Python. It is designed to run on Kali Linux and utilizes multi-threading to bypass the high latency often found when routing traffic through the **Tor network** and **Proxychains**.

---

## 🚀 Features
- **Anonymous:** Automatically starts and routes traffic through Tor.
- **Fast:** Uses `ThreadPoolExecutor` to scan multiple ports simultaneously.
- **Integrated:** Designed to be run as a system-wide command from any directory.
- **Clean UI:** Includes a custom ASCII banner and color-coded output for better readability.

---

## 🛠️ Installation & Setup

If you have cloned this repository, follow these steps to install the tool on your Kali machine:

### 1. Prerequisites
Ensure you have Tor and Proxychains installed:
```bash
sudo apt update && sudo apt install tor proxychains4 python3 -y

2. Move Files to System Paths

To run parce-pscan from anywhere, move the files to the professional Linux hierarchy:
Bash

# Create shared directory for the logic
sudo mkdir -p /usr/local/share/parce-pscan
sudo cp port_scanner.py /usr/local/share/parce-pscan/

# Move the wrapper to your bin folder
sudo cp parce-pscan.sh /usr/local/bin/parce-pscan
sudo chmod +x /usr/local/bin/parce-pscan

📖 How to Use

Simply call the command followed by the target you want to scan:
Bash

parce-pscan <target_ip_or_domain>

Example:
Bash

parce-pscan scanme.nmap.org

The script will:

    Initialize the Tor service.

    Verify connection.

    Launch the scan through a Proxychain.

    Display open ports in green.

⚙️ Technical Details

    Protocol: TCP Connect Scanning.

    Concurrency: 40 simultaneous threads.

    Network Path: Local Traffic -> Proxychains -> Tor Entry Node -> Middle Node -> Exit Node -> Target.

⚠️ Disclaimer & Legal Warning

Usage of this tool for attacking targets without prior mutual consent is illegal.
1. Educational Purposes Only: This tool was created by ParceSnarce for learning purposes and security auditing.
2. Authorized Testing: Do not scan any network or system that you do not own or have explicit, written permission to test.
3. No Support for Illegal Activity: I, ParceSnarce, do not support, encourage, or promote "Black Hat" hacking or any form of cybercrime.
4. User Responsibility: The user is 100% responsible for their actions. I am not liable for any misuse of this script or damage caused by its execution.

Use your skills for good. Stay Ethical. 🛡️
