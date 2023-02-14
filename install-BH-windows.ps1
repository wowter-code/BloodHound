mkdir C:\Bloodhound

cd C:\Bloodhound

iwr -useb https://download.oracle.com/java/19/latest/jdk-19_windows-x64_bin.exe -OutFile C:\Bloodhound\jdk-19.exe

C:\Bloodhound\jdk-19.exe

iwr -useb https://go.neo4j.com/download-thanks.html?edition=community&release=5.4.0&flavour=winzip -OutFile C:\Bloodhound\neo4j_5.4.0.zip

Expand-Archive C:\Bloodhound\neo4j_5.4.0.zip -DestinationPath C:\Bloodhound\neo4j_5.4.0

C:\Bloodhound\neo4j_5.4.0\neo4j.bat install-service

iwr -useb https://github.com/BloodHoundAD/BloodHound/releases/download/4.2.0/BloodHound-win32-x64.zip -OutFile C:\Bloodhound\BloodHound-win32-x64.zip

Expand-Archive C:\Bloodhound\BloodHound-win32-x64.zip -DestinationPath C:\Bloodhound\BloodHound-win32-x64.zip


$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Bloodhound.lnk")
$Shortcut.TargetPath = "C:\WINDOWS\system32\notepad.exe"
$Shortcut.Save()
