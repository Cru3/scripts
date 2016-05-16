#!/bin/bash


#proxychains
echo "Type an IPV4 address to enumerate."

read IP

mkdir Target$IP && nmap -sV -A -O --open -p1-65535 $IP > Target$IP/Services.txt &



sleep 0.5
nmap --script=vuln --script-args=unsafe=1 $IP > Target$IP/Vulnerability.txt &
nmap --script=intrusive $IP > Target$IP/Intrusive.txt &
nmap --script=exploit $IP > Target$IP/Exploit.txt &
dirb http://$IP > Target$IP/DIRB.txt &
nikto -h $IP > Target$IP/NIKTO.txt &
enum4linux $IP > Target$IP/Enum4Linux.txt &
nbtscan -v $IP > Target$IP/NBTScan.txt; done
#msfconsole
