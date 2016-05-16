#!/bin/bash


#proxychains
echo "Type an IPV4 address to enumerate."

read IP

mkdir Target$IP && nmap -sV -A -O --open -p1-65535 $IP > Target$IP/TargetServices.txt &



sleep 0.5
nmap --script=vuln --script-args=unsafe=1 $IP > Target$IP/TargetVulnerability.txt &
nmap --script=intrusive $IP > Target$IP/TargetBrute.txt &
nmap --script=exploit $IP > Target$IP/TargetExploit.txt &
dirb http://$IP > Target$IP/TargetDIRB.txt &
nikto -h $IP > Target$IP/TargetNIKTO.txt; done 
#msfconsole
