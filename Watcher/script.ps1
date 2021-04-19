. {
    param(
        [System.IO.DirectoryInfo]$WatcherDir = "c:\tmp",
        [string]$SatcherWiledCard = 'a*.*',
        [System.IO.DirectoryInfo[]]$copyTo = ("C:\tmp\CopyTo1", "C:\tmp\CopyTo2"),
        [System.IO.FileInfo]$logFile = "C:\tmp\Logs\log.txt",
        [string]$ClientInfoPipeSeparated = "cl\.code\s+(1221|1222|1223)"
        
    )
    $watcher = [System.IO.FileSystemWatcher]::new($WatcherDir, $SatcherWiledCard)
    $watcher.IncludeSubdirectories = $false

    $action = {
        ("{0:yyyy-MM-dd hh24:mm:ss} " -f [datetime]::Now) |  Out-File $logFile -Append -NoNewline
        ($CreatedFile = ($Event.SourceArgs)[1].FullPath) | Out-File $logFile -Append -NoNewline
        if ((Get-Content $CreatedFile -raw) -match $ClientInfoPipeSeparated){
            " match copyed" | Out-File $logFile -Append
            $copyTo.ForEach{
                Copy-Item $CreatedFile -Destination $_
            }
        }
        else {
            " not match " | Out-File $logFile -Append
        }
    }

    Register-ObjectEvent $watcher Created -SourceIdentifier FileCreated -MessageData $logFile -Action $action

    while ($true){
        Start-Sleep -Milliseconds 250 
    }
} 

