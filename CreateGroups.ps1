Install-Module AzureADPreview -AllowClobber -Force
Remove-Module AzureAD
Import-Module AzureADPreview
Connect-AzureAD

# Create Security Group for Secure Workstation Admins
$SecureGroupName1 = "Secure Workstation Admins"
$SecureGroupMailName1 = "SecureWorkstationsAdmins"
$SecureGroup1 = New-AzureADMSGroup `
   -Description "$($SecureGroupName1)" `
   -DisplayName "$($SecureGroupName1)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($SecureGroupMailName1)"

# Create Security Group for Enterprise Workstation Admins
$EnterpriseGroupName1 = "Enterprise Workstation Admins"
$EnterpriseGroupMailName1 = "EnterpriseWorkstationsAdmins"
$EnterpriseGroup1 = New-AzureADMSGroup `
   -Description "$($EnterpriseGroupName1)" `
   -DisplayName "$($EnterpriseGroupName1)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($EnterpriseGroupMailName1)"

# Create Dynamic Security Group for Secure Workstation Users
$SecureGroupName2 = "Secure Workstation Users"
$SecureGroupMailName2 = "SecureWorkstationsUsers"
$SecureGroupQuery2 = '(user.userPrincipalName -startsWith "AZADM-")'
$SecureGroup2 = New-AzureADMSGroup `
   -Description "$($SecureGroupName2)" `
   -DisplayName "$($SecureGroupName2)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($SecureGroupMailName2)" `
   -GroupTypes "DynamicMembership" `
   -MembershipRule "$($SecureGroupQuery2)" `
   -MembershipRuleProcessingState "Paused"
Set-AzureADMSGroup -Id $SecureGroup2.Id -MembershipRuleProcessingState "On"

# Create Security Group for Enterprise Workstation Users
$EnterpriseGroupName2 = "Enterprise Workstation Users"
$EnterpriseGroupMailName2 = "EnterpriseWorkstationsUsers"
$EnterpriseGroup2 = New-AzureADMSGroup `
   -Description "$($EnterpriseGroupName2)" `
   -DisplayName "$($EnterpriseGroupName2)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($EnterpriseGroupMailName2)"

# Create Security Group for Emergency BreakGlass Accounts
$SecureGroupName3 = "Emergency BreakGlass"
$SecureGroupMailName3 = "EmergencyBreakGlass"
$SecureGroup3 = New-AzureADMSGroup `
   -Description "$($SecureGroupName3)" `
   -DisplayName "$($SecureGroupName3)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($SecureGroupMailName3)"

# Create Dynamic Security Group for Secure Workstation Devices
$SecureGroupName4 = "Secure Workstation Devices"
$SecureGroupMailName4 = "SecureWorkstationsDevices"
$SecureGroupQuery4 = '(device.devicePhysicalIds -any _ -contains "[OrderID]:PAW")'
$SecureDevices1 = New-AzureADMSGroup `
   -Description "$($SecureGroupName4)" `
   -DisplayName "$($SecureGroupName4)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($SecureGroupMailName4)" `
   -GroupTypes "DynamicMembership" `
   -MembershipRule "$($SecureGroupQuery4)" `
   -MembershipRuleProcessingState "Paused"
Set-AzureADMSGroup -Id $SecureDevices1.Id -MembershipRuleProcessingState "On"

# Create Dynamic Security Group for Enterprise Workstation Devices
$EnterpriseGroupName4 = "Enterprise Workstation Devices"
$EnterpriseGroupMailName4 = "EnterpriseWorkstationsDevices"
$EnterpriseGroupQuery4 = '(device.devicePhysicalIds -any _ -contains "[OrderID]:EUD")'
$EnterpriseDevices1 = New-AzureADMSGroup `
   -Description "$($EnterpriseGroupName4)" `
   -DisplayName "$($EnterpriseGroupName4)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($EnterpriseGroupMailName4)" `
   -GroupTypes "DynamicMembership" `
   -MembershipRule "$($EnterpriseGroupQuery4)" `
   -MembershipRuleProcessingState "Paused"
Set-AzureADMSGroup -Id $EnterpriseDevices1.Id -MembershipRuleProcessingState "On"

# Create Security Group for PAW Intune Administrators
$SecureGroupName5 = "PAW Intune Administrators"
$SecureGroupMailName5 = "PAWIntuneAdministrators"
$SecureGroup5 = New-AzureADMSGroup `
   -Description "$($SecureGroupName5)" `
   -DisplayName "$($SecureGroupName5)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($SecureGroupMailName5)"

# Create Security Group for EUD Intune Administrators
$EnterpriseGroupName5 = "EUD Intune Administrators"
$EnterpriseGroupMailName5 = "EUDIntuneAdministrators"
$EnterpriseGroup5 = New-AzureADMSGroup `
   -Description "$($EnterpriseGroupName5)" `
   -DisplayName "$($EnterpriseGroupName5)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($EnterpriseGroupMailName5)"

# Create Dynamic Security Group for AADConnect Sync Accounts
$SecureGroupName6 = "AADConnect Sync Accounts"
$SecureGroupMailName6 = "AADConnectSyncAccounts"
$SecureGroupQuery6 = '(user.userPrincipalName -startsWith "Sync_")'
$SecureGroup6 = New-AzureADMSGroup `
   -Description "$($SecureGroupName6)" `
   -DisplayName "$($SecureGroupName6)" `
   -MailEnabled $false `
   -SecurityEnabled $true `
   -MailNickname "$($SecureGroupMailName6)" `
   -GroupTypes "DynamicMembership" `
   -MembershipRule "$($SecureGroupQuery6)" `
   -MembershipRuleProcessingState "Paused"
Set-AzureADMSGroup -Id $SecureGroup6.Id -MembershipRuleProcessingState "On"
