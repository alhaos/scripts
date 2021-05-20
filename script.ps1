$conf = Import-PowerShellDataFile .\conf.psd1
add-type -Path $conf.NLogDllFilePath
$NLogConf = [NLog.Config.LoggingConfiguration]::new()
$fileTarget = [NLog.Targets.FileTarget]::new('logfile')
$fileTarget.FileName = [system.io.path]::Join([System.IO.Directory]::GetCurrentDirectory(), $conf.LogFileDirName, "$($conf.LogFilePrefix)`${shortdate}.log")  
$NLogConf.AddRule([NLog.LogLevel]::Trace, [NLog.LogLevel]::Fatal, $fileTarget)
[NLog.LogManager]::Configuration = $NLogConf
$logger = [NLog.LogManager]::GetLogger('logger')
$logger.Trace(
    [datetime]::Now
)