function Installer($scriptPath) {
    . "$scriptPath\InstallFunctions\CommonFunctions.ps1"
    . "$scriptPath\InstallFunctions\CommonPaths.ps1"

    Install VisualStudio2013Professional
    Install resharper
    Install "python"
    Install "nodejs.install"
    Install "pycharm"
    Install "webstorm"
    Install "easy.install" "easy_install.exe"
    Install "pip"
}

Installer (split-path -parent $MyInvocation.MyCommand.Definition)
