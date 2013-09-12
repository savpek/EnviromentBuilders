function Installer($scriptPath) {
    . "$scriptPath\InstallFunctions\CommonFunctions.ps1"
    . "$scriptPath\InstallFunctions\CommonPaths.ps1"

    Install VisualStudio2012Premium
    Install resharper
    Install "Dogtail.VS2012.3"
}

Installer (split-path -parent $MyInvocation.MyCommand.Definition)