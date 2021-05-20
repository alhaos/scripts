$conf_01 = @{
    username = "mailer@lincolndiagnostic.com"
    password = "Letmein@123!"
    EmailTo = "alhaos@gmail.com"
    EmailFrom = "mailer@lincolndiagnostic.co"
    Subject = "test mail messabe"
    Body = "Test Body"
    SMTPServer = "smtp.office365.com" 
    smtpport = 465
    filenameAndPath = "C:\Program Files\Far Manager\FarRus.lng"
}

$conf_02 = @{
    Username = "alhaos"
    Password = "L#1ollium"
    EmailTo = "alhaos@gmail.com"
    EmailFrom = "alhaos@gmail.com"
    Subject = "test mail messabe"
    Body = "Test Body"
    SMTPServer = "smtp.gmail.com" 
    SMTPPort = 587
    AttachmentFilename = "C:\Program Files\Far Manager\FarRus.lng"
}

$conf = $conf_02

$SMTPMessage = New-Object System.Net.Mail.MailMessage($conf.EmailFrom, $conf.EmailTo, $conf.Subject, $conf.Body)
$attachment = New-Object System.Net.Mail.Attachment($conf.AttachmentFilename)
$SMTPMessage.Attachments.Add($attachment)
$SMTPClient = New-Object Net.Mail.SmtpClient($conf.SmtpServer, $conf.smtpport) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($conf.username, $conf.password); 
$SMTPClient.Send($SMTPMessage)