# Network Scanner

A network reconnaissance tool that automatically discovers active hosts on a local network and performs port scanning to identify open services.

## Overview

The Network Scanner is a bash script that performs two main functions:
1. Discovers active hosts on the local network using ICMP ping requests
2. Conducts port scanning on discovered hosts using nmap's SYN scanning technique

## Prerequisites

- Linux-based operating system
- `nmap` package installed
- Network connectivity
- Root privileges for nmap scanning

## Installation

1. Download the script to your local machine
2. Make the script executable:
```bash
chmod u+x network_scanner.sh
```

## How It Works

The script performs the following operations:
1. Automatically detects the network address of your primary interface
2. Performs ping sweep across all possible hosts (1-254) in the network
3. Creates a sorted list of responsive hosts
4. Conducts TCP SYN scan on all discovered hosts
5. Automatically cleans up temporary files after completion

## Usage

Run the script with sudo privileges:
```bash
sudo ./network_scanner.sh
```

The script will:
1. Extract your network address (e.g., 192.168.1)
2. Ping all possible hosts in that network
3. Create temporary files to store results
4. Perform port scanning on discovered hosts
5. Clean up all temporary files automatically

## Output

- Console output will show:
  - Active hosts discovered during ping sweep
  - Detailed port scan results from nmap
  - Open ports and services on each active host

## Temporary Files Created

The script creates and automatically removes the following temporary files:
- `network_address.txt`: Stores the network address
- `$NETADDR.txt`: Stores raw ping results
- `${NETADDR}_sorted.txt`: Stores sorted list of active hosts

## Troubleshooting

1. If no hosts are discovered:
   - Verify you have network connectivity
   - Check if ICMP is blocked by firewalls
   - Ensure you're running with sudo privileges

2. If port scanning fails:
   - Verify nmap is installed (`sudo apt install nmap`)
   - Check if you have sufficient permissions
   - Ensure target hosts are still active

## Limitations

- Currently supports only IPv4 Class C networks
- Requires root privileges for SYN scanning
- May be detected by intrusion detection systems
- Some hosts might block ICMP ping requests

## Author

Ali Farooq

## Version

1.0

## License

This script is licensed under the GPL License. See LICENSE for more details.

## Security Note

This tool should only be used on networks where you have explicit permission to perform scanning activities. Unauthorized network scanning may be illegal in your jurisdiction.
