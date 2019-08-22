#$credentials = Get-Credential
Import-Module -Name Login-AzureRmAccount
$TenantId = (Get-AzureRmTenant).Id
Connect-AzureAD -TenantId $TenantId
$LogFolder = "C:\Users\Public\Documents"
$LogFile = $LogFolder + "\" + (Get-Date -UFormat "%d-%m-%Y") + ".log"

Function Write-Log
{
	param (
        [Parameter(Mandatory=$True)]
        [array]$LogOutput,
        [Parameter(Mandatory=$True)]
        [string]$Path
	)
	$currentDate = (Get-Date -UFormat "%d-%m-%Y")
	$currentTime = (Get-Date -UFormat "%T")
	$logOutput = $logOutput -join (" ")
	"[$currentDate $currentTime] $logOutput" | Out-File $Path -Append
}


$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

$PasswordProfile.Password = "Password"

New-AzureADGroup -DisplayName "Varonis Assignment2 Group" -MailEnabled $false -SecurityEnabled $true -MailNickName "VaronisAsignment2Group"

$Group = Get-AzureADGroup -SearchString "Varonis Assignment2 Group"

For ($i=0; $i -le 20; $i++) {

    $Displayname = "Test User" + $i
    $UserPrincipalName = "TestUser" + $i + "@varonis.com"
    try {
    	New-AzureADUser -DisplayName $DisplayName -PasswordProfile $PasswordProfile -UserPrincipalName $UserPrincipalName -AccountEnabled $true
    } catch {

	    Continue

    	}
    	Write-Log -LogOutput ("Succeeded in creating a new user:  {0}" + $UserPrincipalName -f $_) -Path $LogFile


    If ($Group.ObjectId) {
    	try {
        	Add-AzureADGroupMember -ObjectId $Group.ObjectId
		} catch {
				Write-Log -LogOutput ("Failed adding user to group:  {0}" + $UserPrincipalName -f $_) -Path $LogFile

	    		Continue
			}

			Write-Log -LogOutput ("Succeeded adding user to group:  {0}" + $UserPrincipalName -f $_) -Path $LogFile
	    }

    }
