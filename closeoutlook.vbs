strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'Outlook.exe'")
For Each objProcess in colProcessList
   Set objOutlook = CreateObject("Outlook.Application")
   objOutlook.Quit
Next

WScript.Sleep 30000

strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'Outlook.exe'")
For Each objProcess in colProcessList
   objProcess.Terminate()
Next