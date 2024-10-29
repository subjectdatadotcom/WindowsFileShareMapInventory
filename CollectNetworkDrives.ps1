# Directory where the text files are stored
$directoryPath = "\\SharedPath\NAS\WinFS"

Get-ChildItem -Path Registry::HKEY_CURRENT_USER\Network | ForEach-Object {
    $fileName = $env:COMPUTERNAME + "-" + $env:USERNAME + ".txt"
    $driveLetter = $_.PSChildName
    $remotePath = (Get-ItemProperty -Path $_.PSPath).RemotePath

    # Corrected line to avoid command not found error
    "$driveLetter -> $remotePath" | Out-File -FilePath "$directoryPath\$fileName" -Append
}
