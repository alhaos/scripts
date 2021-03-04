function Split-Rows {
    param(
        [string]$string,
        [int]$charNumders
    )
    
    $outString = ''
    
    while ($string){
        $splittedText, $string = ([Char[]]$string).where({$_}, [System.Management.Automation.WhereOperatorSelectionMode]::Split, $charNumders)
        Write-Host (-join $string)
        $outString += "$(-join $splittedText)`r`n"
    }
    
    return $outString
}
$text = -join (1..300 | ForEach-Object {"a".."z" | Get-Random})
Split-Rows $text 30






