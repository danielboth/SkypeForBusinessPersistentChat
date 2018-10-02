Function Remove-PersistentChatRoomSession {
    Param (
        [Parameter(Mandatory)]
        [System.Collections.ObjectModel.ReadOnlyCollection`1[Microsoft.Rtc.Collaboration.PersistentChat.ChatRoomSession]]$ChatRoomSession
    )

    $chatRoomSession.EndLeave($chatRoomSession.BeginLeave($null,$null))
}