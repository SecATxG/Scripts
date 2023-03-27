Connect-MgGraph -Scopes "DeviceManagementApps.ReadWrite.All","DeviceManagementConfiguration.ReadWrite.All","DeviceManagementManagedDevices.ReadWrite.All","DeviceManagementServiceConfig.ReadWrite.All","Directory.ReadWrite.All","User.ReadWrite.All","Directory.Read.All","Domain.Read.All","Domain.ReadWrite.All","Group.ReadWrite.All","EntitlementManagement.ReadWrite.All","RoleManagement.ReadWrite.Directory"

$PasswordProfile = @{
  Password = 'abcd.3434'
  ForceChangePasswordNextSignIn = $true
  ForceChangePasswordNextSignInWithMfa = $true
}

# Create Break Glass User 3
$BreakGlassDomain = Get-MgDomain
$BreakGlassDomain = $($BreakGlassDomain).Id
$BreakGlassName3 = "Break Glass User 3"
$BreakGlassUPN3 = "BreakGlass3@$($BreakGlassDomain)"
$BreakGlassMailNickname3 = "BreakGlass3"
$BreakGlass3 = New-MgUser `
   -DisplayName "$($BreakGlassName3)" `
   -PasswordProfile $PasswordProfile `
   -UserPrincipalName "$($BreakGlassUPN3)" `
   -AccountEnabled `
   -MailNickName "$($BreakGlassMailNickname3)"
$BreakGlass3 = Get-MgUser -UserId $BreakGlassUPN3
$BreakGlass3 = $($BreakGlass3).Id
$BreakGlassGroup = Get-MgGroup -Filter "DisplayName eq 'Emergency BreakGlass'"
$BreakGlassGroup = $($BreakGlassGroup).Id
New-MgGroupMember -GroupId $BreakGlassGroup -DirectoryObjectId $BreakGlass3

$params = @{
	"@odata.type" = "#microsoft.graph.unifiedRoleAssignment"
	RoleDefinitionId = "62e90394-69f5-4237-9190-012177145e10"
	PrincipalId = $BreakGlass3
	DirectoryScopeId = "/"
}
New-MgRoleManagementDirectoryRoleAssignment -BodyParameter $params

# Create Break Glass User 4
$BreakGlassDomain = Get-MgDomain
$BreakGlassDomain = $($BreakGlassDomain).Id
$BreakGlassName4 = "Break Glass User 4"
$BreakGlassUPN4 = "BreakGlass4@$($BreakGlassDomain)"
$BreakGlassMailNickname4 = "BreakGlass4"
$BreakGlass4 = New-MgUser `
   -DisplayName "$($BreakGlassName4)" `
   -PasswordProfile $PasswordProfile `
   -UserPrincipalName "$($BreakGlassUPN4)" `
   -AccountEnabled `
   -MailNickName "$($BreakGlassMailNickname4)"
$BreakGlass4 = Get-MgUser -UserId $BreakGlassUPN4
$BreakGlass4 = $($BreakGlass4).Id
New-MgGroupMember -GroupId $BreakGlassGroup -DirectoryObjectId $BreakGlass4

$params = @{
	"@odata.type" = "#microsoft.graph.unifiedRoleAssignment"
	RoleDefinitionId = "62e90394-69f5-4237-9190-012177145e10"
	PrincipalId = $BreakGlass4
	DirectoryScopeId = "/"
}
New-MgRoleManagementDirectoryRoleAssignment -BodyParameter $params
