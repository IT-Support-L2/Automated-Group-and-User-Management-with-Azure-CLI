# Automated-Group-and-User-Management-with-Azure-CLI
Automated Group and User Management with Azure CLI and PowerShell

The Azure PowerShell module (Az) is installed and imported.
    The Connect-AzAccount cmdlet is used to authenticate with Azure. If not already connected, you'll need to run this cmdlet and follow the authentication prompts.
    The Create-AzureADGroup function creates a new Azure AD group using the New-AzADGroup cmdlet.
    The Create-AzureADUser function creates a new Azure AD user using the New-AzADUser cmdlet and then adds the user to the specified group using the Add-AzADGroupMember cmdlet.
    Replace "yourdomain.onmicrosoft.com" with your Azure AD domain.

Before running this script, ensure that you have the necessary permissions to create groups and users within Azure Active Directory, and that you have installed and imported the Azure PowerShell module (Az).
