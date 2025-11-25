# Memory Forensics Analysis Report

## Project Overview
This project demonstrates memory forensics using Volatility 2.6.1 on a Windows XP SP2 memory image (`0zapftis.vmem`). The goal is to identify suspicious processes, network connections, and potential command-and-control (C2) activity.

## Key Findings

### 1. Process Analysis
- The `pslist` and `pstree` commands revealed active processes:
  - `explorer.exe` (PID 1956)
  - `cmd.exe` (PID 544)
  - `svchost.exe` multiple instances
  - VMware and other system processes
- Observed parent-child relationships indicate normal Windows XP system activity, with some suspicious processes communicating over network.

### 2. Network Connections
- `connscan` revealed an active connection to **172.16.98.1:6666** from PID 1956.
- This may indicate malware or unauthorized remote access, as port 6666 is uncommon for normal services.

### 3. Command-Line Analysis
- Attempted to extract command-line arguments for suspicious processes:
  - `cmd.exe` (PID 544)
  - `explorer.exe` (PID 1956)
- Extraction failed for some processes due to memory structure or permission issues.

### 4. Strings and C2 Indicators
- Memory string search identified repeated occurrences of port `6666` and related C2 indicators.
- Extracted artifacts stored in `strings_port.txt` and `c2_strings.txt`.

### 5. DLL and Executable Analysis
- DLLs loaded by suspicious processes (e.g., PID 544 and 1956) listed in `dlllist_*.txt`.
- Executable dumps stored as `executable.544.exe` and `executable.1956.exe` for further static analysis.

## Artifacts Summary
| Artifact | Description |
|----------|-------------|
| pslist.txt / pstree.txt | Process listing and hierarchy |
| connscan.txt / sockscan.txt | Active network connections |
| cmdline_*.txt | Command-line arguments |
| strings_port.txt / c2_strings.txt | Potential C2 strings |
| dlllist_*.txt | DLLs loaded by processes |
| executable_*.exe | Dumped executables for static analysis |

## Conclusion
- Memory forensics revealed a suspicious process communicating over port 6666, likely indicative of a backdoor or malware.
- Further analysis recommended on dumped executables (`executable.544.exe`, `executable.1956.exe`) and C2 indicators.
- The analysis demonstrates typical DFIR workflow: process inspection, network analysis, memory string searching, and artifact extraction.

## Recommendations
1. Isolate affected machine from network.
2. Conduct static and dynamic malware analysis on dumped executables.
3. Monitor network for similar suspicious connections.
4. Document findings for incident response reporting.

---

**Prepared by:** Nitesh Ghimire  
**Date:** 25 November 2025

