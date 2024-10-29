### Script Description
This PowerShell script collects the mapped network drives for the current user and saves them to a `.txt` file in a specified shared directory. Each file is named with the format `COMPUTERNAME-USERNAME.txt`, capturing drive letter to remote path mappings (e.g., `Z -> \\server\share`). This is especially useful for environments where multiple users map network drives, and consolidated records are needed for tracking or reporting purposes.

### Usage
- **Directory Path**: Update `$directoryPath` to the desired shared location where files will be saved.
- **Execution**: This PowerShell script can be deployed via SCCM to collect network drive mappings from all machines, saving each user’s mapped drives as a `.txt` file in a shared directory for centralized tracking.
  
