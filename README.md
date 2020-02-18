# Az Kung Fu - Adminstrator's VM!
Have you ever spent hours building a machine to use as a admin workstation for Azure?   What about installing Windows Subsystem for Linux?  Then this one click deployment is for you.  Use this VM to start down the path of az-kung-fu grasshopper!

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FBuild5Nines%2Faz-kung-fu-vm%2Fmaster%2Fazure-deploy.json" target="_blank">
    <img src="media/Deploy-to-Azure-button.png"/>
</a>

**Software included on the VM**

1. Office 365 Pro Plus
1. Azure Storage Explorer
1. Azure Powershell
1. Azure CLI (Windows)
1. Azure CLI (bash - manual install)
1. Git for Windows (bash)
1. Microsoft Edge
1. Putty
1. SysInternals
1. Visual Studio Code
1. Windows Subsystem for Linux (Ubuntu 18.04)
1. WinRar

**Creds**
1. User: Supplied on deploy
1. Password: Supplied on deploy


**Configure Windows Subsystem for Linux**
1. Double-click Install Ubuntu on Desktop, click Install.
1. Follow prompts to install providing UNIX username and password.
1. Run the following command to install the Azure CLI into WSL

```
sudo apt-get update -y && curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

![alt text](https://github.com/build5nines/az-kung-fu-vm/blob/master/media/wsl.jpg "Configure Ubuntu for Windows")
