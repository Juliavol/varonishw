$Cert = New-SelfSignedCertificate -DnsName $RemoteHostName, $ComputerName `
    -CertStoreLocation "cert:\LocalMachine\My" `
    -FriendlyName "Test WinRM Cert"

$Cert | Out-String

$Thumbprint = $Cert.Thumbprint

Write-Host "Enable HTTPS in WinRM"
$WinRmHttps = "@{Hostname=`"$RemoteHostName`"; CertificateThumbprint=`"$Thumbprint`"}"
winrm create winrm/config/Listener?Address=*+Transport=HTTPS $WinRmHttps

Write-Host "Set Basic Auth in WinRM"
$WinRmBasic = "@{Basic=`"true`"}"
winrm set winrm/config/service/Auth $WinRmBasic

Write-Host "Open Firewall Port"
netsh advfirewall firewall add rule name="Windows Remote Management (HTTPS-In)" dir=in action=allow protocol=TCP localport=5985


# New domain group called “Varonis Assignment1 Group”.
New-ADGroup -Name "Varonis Assignment1 Group" -SamAccountName VA1Group -GroupCategory Security -GroupScope Global -DisplayName "Varonis Assignment1 Group" -Path "CN=Users,DC=Varonis,DC=Com" -Description "Members of this group are Local Administrators"

# New domain user called “Varonis User”.

New-ADUser -Name "Varonis User" -OtherAttributes @{'title'="director";'mail'="VaronisUser@varonis.com";'SamAccountName'="VU1"}

# The user should be part of the group, the group should be part of the ‘local administrators’ group of the domain joined server.
Add-ADGroupMember -Identity VA1Group -Members VU1

