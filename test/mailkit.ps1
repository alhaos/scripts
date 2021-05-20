$conf = @{
    MailKitDllFilePath = 'C:\tmp\win81\MailKit.dll'
}
Add-Type -Path $conf.MailKitDllFilePath
$SMTPClient     = New-Object MailKit.Net.Smtp.SmtpClient
$Message  = New-Object MimeKit.MimeMessage
$TextPart = [MimeKit.TextPart]::new("plain")
$TextPart.Text = "This is a test."
$Message.From.Add("alhaos@gmail.com")
$Message.To.Add("alhaos@gmail.com")
$Message.Subject = 'Test Message'
$Message.Body = $TextPart
$SMTPClient.Connect('smtp.gmail.com', 587, $False)
$SMTPClient.Authenticate('alhaos@gmail.com', 'L!#ollium' )
$SMTPClient.Send($Message)
$SMTPClient.Disconnect($true)
$SMTPClient.Dispose()