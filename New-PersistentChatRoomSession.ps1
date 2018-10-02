Function New-PersistentChatRoomSession {
    Param (
        [Parameter(Mandatory)]
        [string]$RoomName,

        [Parameter(Mandatory)]
        [Microsoft.Rtc.Collaboration.PersistentChat.PersistentChatEndpoint]$PersistentChatEndpoint
    )

    $chatRoomSession = [Microsoft.Rtc.Collaboration.PersistentChat.ChatRoomSession]::new($persistentChatEndpoint)

    $chatRoomSession.EndJoin($chatRoomSession.BeginJoin($RoomName,$null,$null))

    Write-Output $chatRoomSession
}