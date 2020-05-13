#################################################################################
# project: az-kung-fu
# http://www.build5nines.com/az-kung-fu
# MIT License - https://github.com/Build5Nines/az-kung-fu
#################################################################################
# Script Purpose
# - configure the az-kung-fu-vm
# Script Usage
# - custom script extention to configure the az-kung-fu-vm
# - manually configure the WSL ubuntu distro after provisioning
# - make sure to set the repo to Build5Nines and the branch to master for PRs
##################################################################################

#Set GitHub Repo and Branch
$gitHubRepo = "Build5Nines"
$gitHubBranch = "master"

#Install Chocolatey
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Chocolatey Packages to Install
$Packages = `
    'winrar', `
    'git', `
    'putty.install', `
    'sysinternals', `
    'github-desktop', `
    'microsoft-edge', `
    'visualstudiocode', `
    'microsoftazurestorageexplorer',
    'kubernetes-cli',
    'kubernetes-helm',
    'terraform',
    '7zip.install',
    'microsoft-windows-terminal'

#Install Chocolatey Packages
ForEach ($PackageName in $Packages)
{ choco install $PackageName -y }

#Install Azure PowerShell
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-ExecutionPolicy Bypass -Scope Process -Force; Install-Module -Name Az -AllowClobber -Scope AllUsers -Force

#Install Azure CLI for Windows
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'

#Enable WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

#Download and Install Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx

#User must manually configure WSL after reboot, see README.MD file
#Bring down Desktop Shortcuts
$zipDownload = "https://github.com/$gitHubRepo/az-kung-fu-vm/blob/$gitHubBranch/shortcuts.zip?raw=true"
$downloadedFile = "D:\shortcuts.zip"
$vmFolder = "C:\Users\Public\Desktop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $zipDownload -OutFile $downloadedFile
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory($downloadedFile, $vmFolder)

#Reboot
Restart-Computer -Force