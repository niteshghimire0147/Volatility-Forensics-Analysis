#!/bin/bash
# Run all Volatility commands on the memory image

MEM_IMAGE="memory_images/0zapftis.vmem"
PROFILE="WinXPSP2x86"

mkdir -p analysis

echo "[*] Running pslist..."
volatility -f $MEM_IMAGE --profile=$PROFILE pslist > analysis/pslist.txt

echo "[*] Running pstree..."
volatility -f $MEM_IMAGE --profile=$PROFILE pstree > analysis/pstree.txt

echo "[*] Running dlllist for PID 544..."
volatility -f $MEM_IMAGE --profile=$PROFILE dlllist -p 544 > analysis/dlllist_544.txt

echo "[*] Running dlllist for PID 1956..."
volatility -f $MEM_IMAGE --profile=$PROFILE dlllist -p 1956 > analysis/dlllist_1956.txt

echo "[*] Running connscan..."
volatility -f $MEM_IMAGE --profile=$PROFILE connscan > analysis/connscan.txt

echo "[*] Extracting strings..."
volatility -f $MEM_IMAGE --profile=$PROFILE strings | grep -i "6666" > analysis/strings_port.txt

