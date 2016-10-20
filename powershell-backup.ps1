do {
$date = Read-host "Enter date (MM/DD/YYYY) : "
} while ($date -as [datetime] -isnot [datetime])
$date = $date -as [datetime]
$date

$path = "source path"
$destination = new-item source path\$($date.toshortdatestring().replace("/","-")) -type directory 
Foreach($file in (Get-ChildItem $path)) { If($file.LastWriteTime -gt $date.adddays(-1).date) { Move-Item -Path $file.fullname -Destination $destination -Force } }
