#!/bin/bash

####################################################____KALI_LINUX_____###############################################################


#proxychains
echo "READ ME: Runs basic enumeration and vulnerability scripts in the background and generates a unique directory for that target."
sleep 1.5s
tput clear

echo "Please type an IPV4 address to enumerate and press enter."

read IP

mkdir $IP && nmap -sV -A -O --open -p1-65535 $IP > $IP/Services.txt &

echo "Beginning scans on your target of" $IP "Standby." &
sleep 1.0s


echo "Quick port scan to look around while other scans finish. Please check corresponding directory."
nmap --min-rate 10000 -p 21,22,23,80,137,139,443,3306,3309 $IP > $IP/Quickscan.txt
sleep 1s
cat $IP/Quickscan.txt | grep open



sleep 2s
nmap --script=vuln --script-args=unsafe=1 $IP > $IP/Vulns.txt &
nmap --script=intrusive $IP > $IP/Intrusive.txt &
nmap --script=exploit $IP > $IP/Exploit.txt &
dirb http://$IP > $IP/DIRB.txt &
nikto -h $IP > $IP/NIKTO.txt &
enum4linux $IP > $IP/Enum4Linux.txt &
nbtscan -v $IP > $IP/NBTScan.txt &
rm -rf $IP/Quickscan.txt; done
#msfconsole
