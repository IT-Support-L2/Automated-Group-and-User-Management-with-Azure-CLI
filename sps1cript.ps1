# Install and import the Azure PowerShell module
Install-Module -Name Az -Force -AllowClobber -Scope CurrentUser
Import-Module Az

# Connect to Azure account (run Connect-AzAccount and follow authentication prompts if not already connected)
Connect-AzAccount

# Function to create Azure AD group
function Create-AzureADGroup {
    param (
        [string]$GroupName,
        [string]$GroupDescription
    )

    # Create Azure AD group
    New-AzADGroup -DisplayName $GroupName -Description $GroupDescription -MailEnabled $false -SecurityEnabled $true
}

# Function to create Azure AD user
function Create-AzureADUser {
    param (
        [string]$UserName,
        [string]$UserDisplayName,
        [string]$UserPassword,
        [string]$GroupName
    )

    # Create Azure AD user
    $user = New-AzADUser -DisplayName $UserDisplayName -UserPrincipalName "$UserName@yourdomain.onmicrosoft.com" -Password $UserPassword -ForceChangePasswordNextLogin $true

    # Add user to specified group
    Add-AzADGroupMember -MemberObjectId $user.Id -TargetGroupObjectId (Get-AzADGroup -DisplayName $GroupName).Id
}

# Create Azure AD group
Create-AzureADGroup -GroupName "TestGroup" -GroupDescription "Test Group Description"

# Create Azure AD user and add to group
Create-AzureADUser -UserName "testuser" -UserDisplayName "Test User" -UserPassword "Password123" -GroupName "TestGroup"
