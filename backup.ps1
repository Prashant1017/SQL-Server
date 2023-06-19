# Set the path to the WinRAR executable
$winrarExecutable = "C:\Program Files\WinRAR\WinRAR.exe"

# Set the source folder where the autobackup files are located
$backupFolder = "D:\Backup"

# Set the destination folder for the compressed backup files
$destinationFolder = "D:\Backup"

# Create a temporary folder to hold the backup files
$tempFolder = Join-Path -Path $backupFolder -ChildPath "Temp"

# Create the temporary folder if it doesn't exist
if (-not (Test-Path -Path $tempFolder)) {
    New-Item -Path $tempFolder -ItemType Directory | Out-Null
}

# Get the autobackup files from the source folder
$backupFiles = Get-ChildItem -Path $backupFolder -Filter "*.bak"

# Move the backup files to the temporary folder
$backupFiles | ForEach-Object { Move-Item -Path $_.FullName -Destination $tempFolder }

# Set the name for the compressed backup file
$zipFileName = "Autobackup_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".zip"

# Specify the full path for the compressed backup file
$zipFilePath = Join-Path -Path $destinationFolder -ChildPath $zipFileName

# Set the command to compress the backup files using WinRAR
$zipCommand = "& '$winrarExecutable' a -afzip `"$zipFilePath`" `"$tempFolder\*`""

# Execute the WinRAR command
Invoke-Expression -Command $zipCommand

# Display a message indicating the completion of the zipping and deletion process
Write-Host "Autobackup files zipped  successfully!"