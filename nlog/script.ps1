Add-Type -Path '.\dlls\NLog.dll'
[NLog.LogManager]::Configuration = [NLog.Config.XmlLoggingConfiguration]::new('.\dlls\NLog.config')
$logger = [NLog.LogManager]::GetLogger('mylogger')

(2, 3, 4, 0, 6, 12, 27).ForEach{
    try {
        "[{0}]" -f [int](10 / $_)
    }
    catch {
        "error"
    }
}




