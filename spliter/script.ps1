param(
    $reader = [System.IO.StreamReader]::new("D:\repository\scripts\spliter\input.txt"),
    $rowSplitCount = 1000
)
$header = $reader.ReadLine()
$fileIndex = 0
while ($true) {
    $writer = [System.IO.StreamWriter]::new(("D:\repository\scripts\spliter\fileindex{0}" -f ($fileIndex++)))
    $writer.WriteLine($header)
    try {
        for ($i = 0; $i -lt $rowSplitCount; $i++) {
            if ($line = $reader.ReadLine()){
                $writer.WriteLine($line)
            }
            else{
                exit
            }
        }
    }
    finally {
        $writer.Close()
    }
}
$reader.Close()