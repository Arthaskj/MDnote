Dim WshShell 
Set WshShell=WScript.CreateObject("WScript.Shell") 
WshShell.Run "F:\batFile\PublishMark.bat" 
WScript.Sleep 3000 
WshShell.SendKeys "19951026"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 3000 
WshShell.SendKeys "19951026"
WshShell.SendKeys "{ENTER}"