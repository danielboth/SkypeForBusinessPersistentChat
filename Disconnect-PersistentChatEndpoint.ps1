Function Disconnect-PersistentChatEndpoint {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [Microsoft.Rtc.Collaboration.PersistentChat.PersistentChatEndpoint]$PersistentChatEndpoint
    )
    
    $persistentChatEndpoint.EndTerminate($persistentChatEndpoint.BeginTerminate($null,$null))
    $PersistentChatEndpoint.InnerEndpoint.EndTerminate($PersistentChatEndpoint.InnerEndpoint.BeginTerminate($null,$null))
    
}