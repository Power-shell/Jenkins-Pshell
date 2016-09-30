$Date = Get-Date -Format dd.mm.yyyy
$Source = "C:\Users\sw_blazer\.jenkins"
$Destination = "D:\Jenkins-PowerShell-Backups\Jenkins-FullBackup"
$BackupFile = "$Destination\$Date"
$Path = test-path $BackupFile
#Backup Process
if ($Path -eq $true)
{
write-Host "Directory Already Exists"
} elseif ($path -eq $false)
{
cd $Destination
mkdir $Date
copy-Item -Recurse $Source -Destination $BackupFile
$backup_log = Dir -Recurse $Destination | out-File "$Destination\backup_log.txt"
$attachment = "$Destination\backup_log.txt"
write-Host "Backup Successful for $Date"
cd C:\
}

#Copy-Item -Path C:\Users\sw_blazer\.jenkins\* -Destination D:\Jenkins-PowerShell-Backups\
