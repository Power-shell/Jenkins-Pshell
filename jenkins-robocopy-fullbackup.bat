@echo off
set srcDate=%date:~4,2%-%date:~7,2%-%date:~10,4%
set AltDate_=%date:~4,2%%date:~7,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%
set Date_=%date:/=-%
set Source="//JENKINS-SVR10/Users/JENKINS-BACKUP-DND\Full\%srcDate%"
set Destination="D:\Jenkins-SVR10\%srcDate%"

mkdir %Destination%
robocopy "%Source%" "%Destination%" /E /R:1 /W:1 /V /TEE /LOG:Robocopy.log
ForFiles /P %Destination% /D -10 /C "CMD /C if @ISDIR==TRUE echo RD /Q @FILE &RD /Q /S @FILE"
@echo on
echo "Build Successful"
exit 0
