function Encode-CaesarCipher {
    param (
        [char[]]$inputString,
        [int]$shift = 3
    )
    [char[]]$chars = "a".."z" + "а".."я"
    
    $inputString.foreach{
        $EncodeCharArray += $chars.IndexOf($_) -eq -1 ? $_ : $chars.IndexOf($_) + 
    }

    $chars.Count
}
    
Encode-CaesarCipher "hello_word" 3 