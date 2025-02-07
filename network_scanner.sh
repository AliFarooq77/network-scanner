#!/bin/bash

# ==============================================================================
# Author: Ali Farooq
# Description: The script that scans for active hosts on a network and performs port scan to look for open ports.
# Dependencies: nmap
# Version: 1.0
# ==============================================================================

# For IP address belonging to class C
# Get the network address
ip a | grep "3" | grep "inet" | head -n1 | cut -d " " -f6 | cut -d "." -f1-3 > network_address.txt

# Save the network address
NETADDR=$(cat network_address.txt)

echo "" > $NETADDR.txt

# Ping every host in the network
for host in {1..254}
do
  ping -c1 $NETADDR.$host | grep "64 bytes" | cut -d " " -f4 | tr -d ":" >> $NETADDR.txt &
done

cat $NETADDR.txt | sort > ${NETADDR}_sorted.txt

# Port scan
nmap -sS -iL ${NETADDR}_sorted.txt

# Removing helping text files
rm network_address.txt $NETADDR.txt ${NETADDR}_sorted.txt

exit
