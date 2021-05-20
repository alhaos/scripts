[pscustomobject[]]$objList1 = @'
[
    {"name":1, "value":"один"},
    {"name":2, "value":"два"},
    {"name":3, "value":"три"},
    {"name":4, "value":"четыре"}
]
'@ | ConvertFrom-Json

[pscustomobject[]]$objList2 = @'
[
    {"name":1, "value":"один"},
    {"name":2, "value":"два"},
    {"name":3, "value":"три"},
    {"name":5, "value":"пять"}
]
'@ | ConvertFrom-Json

[System.Linq.Enumerable]::Distinct([System.Linq.Enumerable]::Except($objList1, $objList2))
