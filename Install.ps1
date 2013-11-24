Set-StrictMode -Version Latest

# This is hotfix for chocolatey bug.
$env:ChocolateyInstall = "C:\Chocolatey"

function Installer([string]$scriptPath) {
    . "$scriptPath\InstallFunctions\CommonFunctions.ps1"
    . "$scriptPath\InstallFunctions\CommonPaths.ps1"

    CreateIfMissingFile $profile
    CreateIfMissingDir $installerPaths.GitHub

    function InstallChocolatey() {
        Write-Host "Install chocolate package manager." -ForegroundColor Green
        powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
        AddPathToEnvironment ";C:\chocolatey\bin;"
    }

    InstallChocolatey
    Install "git" "git.exe"
    Install "poshgit"
    Install "notepad2"
    Install "winmerge" "WinMergeU.exe"
    Install "7Zip"
    Install "Pester"
    Install "GoogleChrome"
    Install "putty" "putty.exe"
    Install "adobereader"
    Install "greenshot"
    Install "linqPad4"
    Install "LogExpert"
    Install "Dexpot"
    Install "winscp"

    function ConfigurePowerShellProfile() {
        Write-Host "Install powershell profile." -ForegroundColor Green
        
        GitHubClone "https://github.com/savpek/Powershell-Profile.git" $installerPaths.GitHub
        
        . "$($installerPaths.CustomShellProfile)\Install.ps1"
    }
    ConfigurePowerShellProfile

    CreateIfMissingDir "${env:APPDATA}\Dexpot\Profile\"
    Copy-Item "$scriptPath\SoftwareProfiles\Dexpot\*.dxp" "${env:APPDATA}\Dexpot\Profile\" -Force

    Write-Host "Notes:" -ForegroundColor Green
    "Open dexpot and set Savpek profile, this step isn't automated."
}

Installer (split-path -parent $MyInvocation.MyCommand.Definition)

. $profile
