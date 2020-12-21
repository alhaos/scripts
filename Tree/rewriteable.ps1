param (
    [System.IO.DirectoryInfo]$sourseDirectory = "C:\Program Files\Far Manager",
    [System.IO.DirectoryInfo]$destinationDirectory = "D:\tmp",
    [int]$useCreationOrModifiedFileDateTimeSwitch = 0 # [0] (Use Creation DateTime) or [1] (Use Modified DateTime)
)

enum CreationOrModifiedFileDateTimeSwitch{
    UseCreationDateTime = 0
    UseModifiedDateTime = 1
}

class FileCopyer{
    hidden [System.IO.DirectoryInfo]$sourseDirectory
    hidden [System.IO.DirectoryInfo]$destinationDirectory
    hidden [CreationOrModifiedFileDateTimeSwitch]$useCreationOrModifiedFileDateTimeSwitch

    FileCopyer([System.IO.DirectoryInfo]$sourseDirectory, [System.IO.DirectoryInfo]$destinationDirectory, [CreationOrModifiedFileDateTimeSwitch]$useCreationOrModifiedFileDateTimeSwitch){
        $this.sourseDirectory = $sourseDirectory
        $this.destinationDirectory = $destinationDirectory
        $this.useCreationOrModifiedFileDateTimeSwitch = $useCreationOrModifiedFileDateTimeSwitch
    }

    [void] CopyFiles() {
        Get-ChildItem -Path $this.sourseDirectory -File | ForEach-Object {
            if ($useCreationOrModifiedFileDateTimeSwitch -eq [CreationOrModifiedFileDateTimeSwitch]::UseModifiedDateTime){
                $year = [int]($_.LastWriteTime.ToString('yyyy'))
                $month = [int]($_.LastWriteTime.ToString('MM'))
            } else {
                $year = [int]($_.CreationTime.ToString('yyyy'))
                $month = [int]($_.CreationTime.ToString('MM'))
            }
            $pathWithYear = Join-Path $this.destinationDirectory -ChildPath $year
            if (!(Test-Path $pathWithYear)) {New-Item $pathWithYear -ItemType Directory}
            $pathWithYearMonth = Join-Path $pathWithYear -ChildPath $month
            if (!(Test-Path $pathWithYearMonth)) {New-Item $pathWithYearMonth -ItemType Directory}
            Copy-Item $_.FullName -Destination $pathWithYearMonth
        }
    }   
}

$FileMoverInstance = [FileCopyer]::New($sourseDirectory, $destinationDirectory, $useCreationOrModifiedFileDateTimeSwitch)
$FileMoverInstance.CopyFiles()