$Now = Get-Date
$Days = "1"
$Targetfolder = "C:\Users\....\.jenkins\"
$Destinationfolder = "D:\Jenkins-PowerShell-Backups\Jenkins-Ps-IncBackups\"
$Extension = "*.*"
$Lastwrite = $Now.AddDays(-$Days)
if ($(Test-Path $Destinationfolder) -eq $True){
    if (-Not((Get-ChildItem -Force $Destinationfolder) -eq $Null)){
        $Files = Get-ChildItem $Targetfolder -include $Extension -Recurse | where {$_.LastwriteTime -le "$Lastwrite"}
        foreach ($File in $Files)
        {
            if ($File -ne $Null)
            {
               $Filename = $File.name
            Copy-Item -Path $File -Destination $Destinationfolder$Filename
               write-host "File $Filename copied from $Targetfolder to $Destinationfolder"
 
            }
            else
            {
                write-host "No more files to copy"
            }
        }
    }
    else{
        write-output "Destination Folder $Destinationfolder is empty and all files will be moved to destination folder from $Targetfolder"
        if ($(Test-Path $Targetfolder) -eq $True){
            if (-Not((Get-ChildItem -Force $Targetfolder) -eq $Null)){
                $results = Get-ChildItem $Targetfolder -Recurse
                foreach ($path in $results){
                    $filename = [System.IO.Path]::GetFileName($path)
                    Copy-Item -Path $Targetfolder\\$path -Destination $Destinationfolder$filename
                    write-host "File $filename copied from $Targetfolder to $Destinationfolder"
                }
            }

        }
    }
}
else{
    write-host "$Destinationfolder does not exist"
}
