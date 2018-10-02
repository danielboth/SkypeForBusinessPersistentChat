Function Receive-PersistentChatMessage {
    [CmdletBinding()]
    Param (
        # The number of messages to recieve
        [Parameter(Mandatory)]
        [int]$Number,

        # The chatroom session to receive the messages from
        [Parameter(Mandatory)]
        [System.Collections.ObjectModel.ReadOnlyCollection`1[Microsoft.Rtc.Collaboration.PersistentChat.ChatRoomSession]]$ChatRoomSession
    )

    $chatRoomSession.EndGetRecentChatHistory($chatRoomSession.BeginGetRecentChatHistory($Number,$null,$null))
}