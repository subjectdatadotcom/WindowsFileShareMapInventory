# Network Drive Mapping Collection and Consolidation

This repository contains two PowerShell scripts designed to collect network drive mappings from users across multiple machines and consolidate them into a single CSV file for centralized tracking.

## Scripts

### 1. `CollectNetworkDrives.ps1`
This script collects the mapped network drives for each user and saves the mappings to individual `.txt` files. Each file is named with the format `COMPUTERNAME-USERNAME.txt` and contains drive letter-to-remote path mappings, such as `Z -> \\server\share`.

**Usage**:
- Update `$directoryPath` to the desired shared location where the `.txt` files will be stored (e.g., `"\\SharedPath\NAS\WinFS"`).
- Deploy this script via SCCM to all target machines, allowing it to run with administrative rights to access necessary registry paths.
  
**Command Line for SCCM Deployment**:
```powershell
powershell.exe -ExecutionPolicy Bypass -File CollectNetworkDrives.ps1
```

### 2. `ConsolidateMappedDrives.ps1`
This script reads all `.txt` files created by `CollectNetworkDrives.ps1` from the shared directory and consolidates them into a single CSV file with unique drive mappings. The output CSV is named `ConsolidatedMappedDrives.csv` and contains two columns: `DriveLetter` and `RemotePath`.

**Usage**:
- Ensure `$directoryPath` is set to the same shared location where `.txt` files are stored.
- Run this script after the initial data collection is complete to consolidate all mappings into a single CSV file with unique entries.

---

### Example Output
The consolidated CSV file will look like this:

| DriveLetter | RemotePath          |
|-------------|----------------------|
| Z           | \\server\share      |
| X           | \\another\path      |

### Requirements
- **PowerShell**: Both scripts require PowerShell to run.
- **SCCM Deployment**: Recommended for large-scale execution of `CollectNetworkDrives.ps1`.

