# Create Secure Workstation User
$SecureUserFirstName1 = "<First Name>"
$SecureUserLastName1 = "<Last Name>"
$SecureUserDomain = Get-AzureADDomain
$SecureUserDomain = $($SecureUserDomain).Name
$SecureUserName1 = "Azure Admin $($SecureUserFirstName1) $($SecureUserLastName1)"
$SecureUserUPN1 = "AZADM-$($SecureUserFirstName1).$($SecureUserLastName1)@$($SecureUserDomain)"
$SecureUserMailNickname1 = "$($SecureUserFirstName1).$($SecureUserLastName1)"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "abcd.1234"
$SecureUser1 = New-AzureADUser `
   -DisplayName "$($SecureUserName1)" `
   -PasswordProfile $PasswordProfile `
   -UserPrincipalName "$($SecureUserUPN1)" `
   -AccountEnabled $true `
   -MailNickName "$($SecureUserMailNickname1)"

# Create PAW Intune Admin 1
$SecureUserDomain = Get-AzureADDomain
$SecureUserDomain = $($SecureUserDomain).Name
$SecureUserName2 = "PAW Intune Admin 1"
$SecureUserUPN2 = "PAWIntuneAdmin1@$($SecureUserDomain)"
$SecureUserMailNickname2 = "PAWIntuneAdmin1"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "abcd.1234"
$SecureUser2 = New-AzureADUser `
   -DisplayName "$($SecureUserName2)" `
   -PasswordProfile $PasswordProfile `
   -UserPrincipalName "$($SecureUserUPN2)" `
   -AccountEnabled $true `
   -MailNickName "$($SecureUserMailNickname2)"
$SecureUser2 = Get-AzureADUser -ObjectId $SecureUserUPN2
$SecureUser2 = $($SecureUser2).ObjectId
$SecureUserGroup2 = Get-AzureADGroup -SearchString "PAW Intune Administrators"
$SecureUserGroup2 = $($SecureUserGroup2).ObjectId
Add-AzureADGroupMember -ObjectId $SecureUserGroup2 -RefObjectId $SecureUser2
     
# Create EUD Intune Admin 1
$SecureUserDomain = Get-AzureADDomain
$SecureUserDomain = $($SecureUserDomain).Name
$SecureUserName3 = "EUD Intune Admin 1"
$SecureUserUPN3 = "EUDIntuneAdmin1@$($SecureUserDomain)"
$SecureUserMailNickname3 = "EUDIntuneAdmin1"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "abcd.1234"
$SecureUser3 = New-AzureADUser `
   -DisplayName "$($SecureUserName3)" `
   -PasswordProfile $PasswordProfile `
   -UserPrincipalName "$($SecureUserUPN3)" `
   -AccountEnabled $true `
   -MailNickName "$($SecureUserMailNickname3)"
$SecureUser3 = Get-AzureADUser -ObjectId $SecureUserUPN2
$SecureUser3 = $($SecureUser3).ObjectId
$SecureUserGroup3 = Get-AzureADGroup -SearchString "EUD Intune Administrators"
$SecureUserGroup3 = $($SecureUserGroup3).ObjectId
Add-AzureADGroupMember -ObjectId $SecureUserGroup3 -RefObjectId $SecureUser3
