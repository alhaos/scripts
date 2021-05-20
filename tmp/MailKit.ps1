"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
Add-Type -Path "C:\Program Files\PackageManagement\NuGet\Packages\MailKit.2.12.0\lib\net50\MailKit.dll"

$SMTPClient = New-Object MailKit.Net.Smtp.SmtpClient
$Message  = New-Object MimeKit.
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


Install-Package -Name 'MailKit' -Source 'nuget.org'