import socket
import time
import sys
from concurrent.futures import ThreadPoolExecutor

GREEN = "\033[92m"
RED = "\033[91m"
RESET = "\033[0m"

if len(sys.argv) < 2:
    sys.exit(1)

target = sys.argv[1]

try:
    target_ip = socket.gethostbyname(target)
except socket.gaierror:
    print(f"{RED}❌ Error: Could not resolve hostname {target}{RESET}")
    sys.exit(1)

def scan_port(port):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(1.5)
        result = s.connect_ex((target_ip, port))
        if result == 0:
            print(f"{GREEN}[+] Found open port: {port}{RESET}")
        s.close()
    except:
        pass

print(f"[*] Target: {target} ({target_ip})")
start_time = time.time()

with ThreadPoolExecutor(max_workers=40) as executor:
    executor.map(scan_port, range(20, 446))

print(f"[*] Scan duration: {time.time() - start_time:.2f}s")
# Ensure the python script exits with 0
sys.exit(0)











