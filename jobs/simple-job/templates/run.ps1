$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

Start-Process "C://var/vcap/packages/odbc/setup.exe -ArgumentList "–i silent –f installer.properties -Wait
