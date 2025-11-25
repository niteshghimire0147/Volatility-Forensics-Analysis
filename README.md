# Volatility Memory Analysis Project
Memory forensics investigation using Volatility 2

## Overview
This project demonstrates a memory forensics investigation using Volatility 2.6.1 on a Windows XP memory dump (`0zapftis.vmem`). The analysis includes process enumeration, network connections, command line extraction, DLL listing, and memory string searches to identify potential indicators of compromise (IoCs) and malware artifacts.

## Memory Image
- Filename: `0zapftis.vmem`
- Operating System: Windows XP SP2 x86
- Source: Practice DFIR memory dump

## Tools Used
- Volatility 2.6.1
- Ubuntu Linux environment
- Python 3.x (Volatility dependency)

## Analysis Conducted
1. Process list (`pslist`, `pstree`)
2. Command line extraction (`cmdline`)
3. DLL listing (`dlllist`)
4. Network connections (`connscan`, `sockscan`)
5. String searches for IPs, ports, and potential C2 indicators
6. Extraction of executable memory segments

## Folder Structure
- `scripts/` → Contains automation scripts to run Volatility commands
- `screenshots/` → Screenshots of alerts, outputs, and findings
- `screenshots/artifacts/` → Artifacts from memory analysis (optional)
- `requirements.txt` → Python dependencies for Volatility

## How to Run
1. Clone this repository:
   ```bash
   git clone <repo-url>
   cd volatility-memory-analysis
