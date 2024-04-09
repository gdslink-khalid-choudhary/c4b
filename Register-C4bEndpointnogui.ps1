$ClientCommunicationSalt = ':]w/bW-l%}r(Bcniw38A{tv_Z+6T%a)K'
$ServiceCommunicationSalt = '^9Q=]jo2m;Hd7%zt)S.!G&C[K}E6CMU%'
$FQDN = 'c4b.api-dataview360.com'
$NexusUserPW = 'G!D(GD4;&Yb.[m6]f]t[xU_QHlx^&MfH'

# Touch NOTHING below this line
$User = 'chocouser'
$SecurePassword = $NexusUserPW | ConvertTo-SecureString -AsPlainText -Force
$RepositoryUrl = "https://$($fqdn):8443/repository/ChocolateyInternal/"

$credential = [pscredential]::new($user, $securePassword)

$downloader = [System.Net.WebClient]::new()
$downloader.Credentials = $credential

$script =  $downloader.DownloadString("https://$($FQDN):8443/repository/choco-install/ClientSetupnogui.ps1")

$params = @{
    Credential      = $Credential
    ClientSalt      = $ClientCommunicationSalt
    ServiceSalt      = $ServiceCommunicationSalt
    InternetEnabled = $true
    RepositoryUrl   = $RepositoryUrl
}

& ([scriptblock]::Create($script)) @params
