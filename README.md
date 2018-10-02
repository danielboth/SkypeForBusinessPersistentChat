# SkypeForBusinessPersistentChat
PowerShell module to send and receive persistent chat messages

Initial release of PowerShell module functions based on the UCMA.

This needs the UCMA 4.0 installed on the box where the module will run, this can be downloaded here:
https://www.microsoft.com/en-us/download/confirmation.aspx?id=34992

A patch for UCMA 4.0 is available here:
https://www.microsoft.com/en-us/download/confirmation.aspx?id=36826

The PersistentChatSdk is available for download here:
https://www.microsoft.com/en-us/download/details.aspx?id=35458

Before using the module, please make sure you add the required dlls to the root of the folder, the module requires:
- Microsoft.Rtc.Collaboration.dll
- Microsoft.Rtc.Collaboration.PersistentChat.dll
- Microsoft.Rtc.Chat.Endpoint.dll
