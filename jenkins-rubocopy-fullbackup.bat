@echo off
set AltDate_=%date:~4,2%%date:~7,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%
set Date_=%date:/=-%
set Source="C:\Users\sw_blazer\.jenkins"
set Destination="D:\Jenkins-Backup\RoboCopy\%Date_%"
set Backup="D:\Jenkins-Backup\RoboCopy\%AltDate_%"
mkdir %Destination%
robocopy /it /v /r:1 /w:10 /maxage:1 /tee /XA:H "%Source%" "%Destination%"
mkdir %Backup%
XCopy %Destination% %Backup% /s /e /h
@echo on
