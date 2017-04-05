try
{
  Enable-PSRemoting -Force
  Set-Item wsman:\localhost\client\trustedhosts * -Force
  Restart-Service WinRM -Force
}
catch
{
    Exit 1
}
Exit 0
