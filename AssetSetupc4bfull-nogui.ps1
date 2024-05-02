##Install Gui:
##enable TLS1.2, ignore below line on 2019 WS/win10+
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString("C:\Register-C4bEndpointnogui.ps1"))
