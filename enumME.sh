
#!/bin/bash

######################################################RAPID#ENUMERATION#SCRIPT####################################################


#proxychains
echo "READ ME: Runs basic enumeration and vulnerability scripts and commits them to a custom directory.
sleep 0.2s

echo "Please type an IPV4 address to enumerate and press enter."

read IP

mkdir $IP && nmap --open -p1-65535 $IP > $IP/Open.txt &

echo "Beginning scans on your target of" $IP "Standby." &
sleep 1.0s


echo "Quick port scan to look around while other scans finish. Please check corresponding directory."
nmap --min-rate 10000 -p 21,22,23,80,137,139,443,445,3306,3309,3389 $IP > $IP/Quick.txt
sleep 1s
cat $IP/Quick.txt | grep open



sleep 2s

./dirb/dirb http://$IP > $IP/DIRB.txt &
nbtscan $IP > $IP/NBTScan.txt &
enum4linux/enum4linux.pl $IP > $IP/Enum4Linux.txt &
nmap -sV -sC -v $IP > $IP/Services.txt &&
nmap --script=vuln --script-args=unsafe=1 -vv $IP > $IP/Vulns.txt &&
nmap --script=exploit --script-args=unsafe=1 $IP -vv > $IP/Exploit.txt &&
nmap --script=intrusive $IP -vv > $IP/Intrusive.txt &&

rm -rf $IP/Quick.txt; done
#msfconsole

