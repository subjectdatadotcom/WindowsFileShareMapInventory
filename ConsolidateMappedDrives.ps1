# Directory where the text files are stored
$directoryPath = "\\SharedPath\NAS\WinFS"

# Output CSV file path
$outputCsvPath = "$directoryPath\ConsolidatedMappedDrives.csv"

# Initialize an empty array to store unique drive mappings
$uniqueMappings = @()

# Loop through each .txt file in the directory
Get-ChildItem -Path $directoryPath -Filter "*.txt" | ForEach-Object {
    # Read each line from the file
    $fileContent = Get-Content -Path $_.FullName
    
    # Add each line to the array, removing duplicates automatically
    $uniqueMappings += $fileContent
}

# Get distinct mappings from all files
$distinctMappings = $uniqueMappings | Sort-Object -Unique

# Export to CSV with headers
$distinctMappings | ForEach-Object {
    $driveLetter, $remotePath = $_ -split ' -> '
    [pscustomobject]@{
        DriveLetter = $driveLetter
        RemotePath  = $remotePath
    }
} | Export-Csv -Path $outputCsvPath -NoTypeInformation -Force

Write-Output "Consolidated CSV created at: $outputCsvPath"
