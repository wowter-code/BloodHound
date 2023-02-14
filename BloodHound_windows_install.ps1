# This script installs BloodHound v.4.2.0 and its prerequisites as presented in https://bloodhound.readthedocs.io/en/latest/installation/windows.html

mkdir C:\Bloodhound
cd C:\Bloodhound
Add-MpPreference -ExclusionPath C:\Bloodhound

# Download and install JDK
$ProgressPreference = 'SilentlyContinue'
iwr -useb https://aka.ms/download-jdk/microsoft-jdk-11.0.18-windows-x64.msi -OutFile C:\Bloodhound\microsoft-jdk-11.0.18-windows-x64.msi

Start-Process -FilePath C:\Bloodhound\microsoft-jdk-11.0.18-windows-x64.msi -Wait

$Env:Path

# Download and install neo4j
$ProgressPreference = 'SilentlyContinue'
iwr -useb 'https://neo4j.com/artifact.php?name=neo4j-community-4.4.17-windows.zip' -OutFile C:\Bloodhound\neo4j_4.4.17.zip

$ProgressPreference = 'SilentlyContinue'
Expand-Archive -Path C:\Bloodhound\neo4j_4.4.17.zip -DestinationPath C:\Bloodhound\

C:\Bloodhound\neo4j-community-4.4.17\bin\neo4j.bat install-service

net start neo4j

# Download and creade Desktop shorcut for BloodHound
$ProgressPreference = 'SilentlyContinue'
iwr -useb https://github.com/BloodHoundAD/BloodHound/releases/download/4.2.0/BloodHound-win32-x64.zip -OutFile C:\Bloodhound\BloodHound-win32-x64.zip

$ProgressPreference = 'SilentlyContinue'
Expand-Archive C:\Bloodhound\BloodHound-win32-x64.zip -DestinationPath C:\Bloodhound\

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\BloodHound.lnk")
$Shortcut.TargetPath = "C:\Bloodhound\BloodHound-win32-x64\BloodHound.exe"
$Shortcut.Save()

# Cleanup zip acthives
rm C:\Bloodhound\neo4j_4.4.17.zip
rm C:\Bloodhound\microsoft-jdk-11.0.18-windows-x64.msi
rm C:\Bloodhound\BloodHound-win32-x64.zip

write-host ""
write-host "==========================" -ForegroundColor Green
write-host "Installation completed!!!" -ForegroundColor Green
