param(
    # settings file name
    [Parameter(Mandatory=$false, Position=0)]
    [ValidateScript({[System.IO.File]::Exists($_) -and ([System.IO.FileInfo]$_).Name -eq "settings.xml"})]
    [System.IO.FileInfo]$settingsFileName = ".\settings.xml"
)

[xml]$settings = Get-Content $settingsFileName
$lastInerationIndex = $settings.Root.LastInerationIndex
$settings.Root.LastInerationIndex = (Get-EventLog -LogName Security | Select-Object -First 1).Index.ToString()

Get-EventLog -LogName Security -InstanceId 5157 -ErrorAction SilentlyContinue | Where-Object{$_.Index -gt $lastInerationIndex} | ForEach-Object{
   ([regex]"Адрес источника:\s*(.*)\s").Matches($_.Message).Groups[1].Value
}

$settings.Save($settingsFileName)
