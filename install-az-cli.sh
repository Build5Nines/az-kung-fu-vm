#!/bin/bash
#################################################################################
# project: az-kung-fu
# http://www.build5nines.com/az-kung-fu
# MIT License - https://github.com/Build5Nines/az-kung-fu
#################################################################################
# Script Purpose
# - configure the az-kung-fu-vm
# Script Usage
# - Use this to install the azure cli manually if issues with script
# - for your az-kung-fu-vm.
##################################################################################
# Get packages needed for the install process
apt-get update
apt-get install ca-certificates curl apt-transport-https lsb-release gnupg unzip -y

# Download and install the Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc | 
    gpg --dearmor | 
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

# Add the Azure CLI software repository
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | 
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update repository information and install the azure-cli package
apt-get update
apt-get install azure-cli -y

# Download and install terraform
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip
sudo install terraform /usr/local/bin/