param(
    # settings file name
    [Parameter(Mandatory = $false, Position = 0)]
    [ValidateScript( { [System.IO.File]::Exists($_) -and ([System.IO.FileInfo]$_).Name -eq "settings.xml" })]
    [System.IO.FileInfo]$settingsFileName = ".\settings.xml"
)

[xml]$settings = Get-Content $settingsFileName
$lastInerationIndex = $settings.Root.LastInerationIndex
$settings.Root.LastInerationIndex = (Get-EventLog -LogName Security | Select-Object -First 1).Index.ToString()

$records = Get-EventLog -LogName Security -InstanceId 5157 -ErrorAction SilentlyContinue | Where-Object { $_.Index -gt $lastInerationIndex } | ForEach-Object {
    [PSCustomObject]@{
        ip   = ([regex]"Адрес источника:\s*(.*)\s").Matches($_.Message).Groups[1].Value
        port = ([regex]"Порт назначения:\s*(.*)\s").Matches($text).Groups[1].Value
    }
}

$records = $records.Where{$_.port -eq 3389}
$records
$settings.Save($settingsFileName)
