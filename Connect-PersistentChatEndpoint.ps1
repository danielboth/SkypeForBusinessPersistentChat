Function Connect-PersistentChatEndpoint {
    [CmdletBinding()]
    Param (
        # The SipAddress of the user to connect to persistent chat
        [Parameter(Mandatory)]
        [string]$SipAddress,
        
        # The credentials of the user
        [Parameter(Mandatory)]
        [pscredential]$Credential
    )
    
    $clientPlatformSettings = [Microsoft.Rtc.Collaboration.ClientPlatformSettings]::new('PersistentChat.PowerShell','Tls')
    $collaborationPlatform = [Microsoft.Rtc.Collaboration.CollaborationPlatform]::new($clientPlatformSettings)
    $collaborationPlatform.AllowedAuthenticationProtocol = 'Kerberos'

    $collaborationPlatform.EndStartup($collaborationPlatform.BeginStartup($null,$null))
    $userEndpointSettings = [Microsoft.Rtc.Collaboration.UserEndpointSettings]::new($SipAddress)
    $userEndpointSettings.Credential = $Credential.GetNetworkCredential()
    $userEndpoint = [Microsoft.Rtc.Collaboration.UserEndpoint]::new($collaborationPlatform,$userEndpointSettings)
    $null = $userEndpoint.EndEstablish($userEndpoint.BeginEstablish($null,$null))

    $provisioningData = $userEndpoint.EndGetProvisioningData($userEndpoint.BeginGetProvisioningData($null,$null))
    $persistentChatUri = $provisioningData.PersistentChatConfiguration.DefaultPersistentChatUri
    $persistentChatEndpoint = [Microsoft.Rtc.Collaboration.PersistentChat.PersistentChatEndpoint]::new($persistentChatUri, $userEndpoint)
    $null = $persistentChatEndpoint.EndEstablish($persistentChatEndpoint.BeginEstablish($null,$null))

    Write-Output $persistentChatEndpoint
}