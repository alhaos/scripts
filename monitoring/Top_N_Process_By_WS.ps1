Get-Process |
  Sort-Object WorkingSet -Descending |
    Select-Object -First 10 |
      ForEach-Object {
        [pscustomobject]@{
          name = $_.ProcessName
          'WS(Mb)' = [int]($_.WorkingSet / 1mb)
        }
      }
