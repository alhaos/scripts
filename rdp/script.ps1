& {
    param(
        [Parameter(Mandatory)]
        [String]
        $logName,

        [Parameter(Mandatory)]
        [System.IO.FileInfo]
        $outFile

    )

    if (-not [System.Diagnostics.EventLog]::Exists($logName)) {
        Write-Host -ForegroundColor red 'Error.'
    }

    Get-EventLog | ForEach-Object {
        switch ($_.EntryType) {
            'Information' {
                [PSCustomObject]@{
                    Color = [System.ConsoleColor]::Green
                    Object = $_
                }
             }
            'Error' {
                [PSCustomObject]@{
                    Color = [System.ConsoleColor]::Black
                    Object = $_
                }
             }
        }
    } | ConvertTo-Xml | Out-File 
} -logName 'Windows PowerShel' -outFile c:\tmp\out.xml




