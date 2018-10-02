param (
    [bool]$IsDebug = $false
)

# Load required assemblies (all version 4 of Unified Communications Managed API!)
[System.Reflection.Assembly]::LoadFile("$PSScriptRoot\Microsoft.Rtc.Collaboration.dll")
[System.Reflection.Assembly]::LoadFile("$PSScriptRoot\Microsoft.Rtc.Collaboration.PersistentChat.dll")
[System.Reflection.Assembly]::LoadFile("$PSScriptRoot\Microsoft.Rtc.Chat.Endpoint.dll")

foreach ($item in Get-ChildItem -Path $PSScriptRoot\*.ps1) {
    if ($IsDebug) {
        # Performance is not important...
        . $item.FullName
    } else {
        # InvokeScript(useLocalScope, scriptBlock, input, args)
        $ExecutionContext.InvokeCommand.InvokeScript(
            $false,
            (
                [scriptblock]::Create(
                    [io.file]::ReadAllText(
                        $item.FullName
                    )
                )
            ),
            $null,
            $null
        )
    }
}

