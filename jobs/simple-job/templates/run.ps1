$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

Start-Process "C://var/vcap/packages/odbc/whatever.exe" -ArgumentList "/s /l c:\temp" -Wait
