$cred = Get-Credential

$endpoint = Connect-PersistentChatEndpoint -SipAddress 'sip:daniel@poshboth.nl' -Credential $cred
$chatRoomSession = New-PersistentChatRoomSession -RoomName 'PSCONF' -PersistentChatEndpoint $endpoint

# We should now have an active session
$endpoint.ActiveChatRoomSessions

Send-PersistentChatMessage -Message 'Doing Persistent Chat with PowerShell and UCMA @ PSCONFEU 2017!' -ChatRoomSession $chatRoomSession

Remove-PersistentChatRoomSession -ChatRoomSession $chatRoomSession

Disconnect-PersistentChatEndpoint -PersistentChatEndpoint $endpoint