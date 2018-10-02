Function Send-PersistentChatMessage {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$Message,

        [Parameter(Mandatory)]
        [System.Collections.ObjectModel.ReadOnlyCollection`1[Microsoft.Rtc.Collaboration.PersistentChat.ChatRoomSession]]$ChatRoomSession
    )

    $chatRoomSession.EndSendChatMessage($chatRoomSession.BeginSendChatMessage($Message,$null,$null))
}