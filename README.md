<p align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/plausible/community-edition/refs/heads/v2.1.1/images/logo_dark.svg" width="300">
        <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/plausible/community-edition/refs/heads/v2.1.1/images/logo_light.svg" width="300">
        <img src="https://raw.githubusercontent.com/plausible/community-edition/refs/heads/v2.1.1/images/logo_light.svg" width="300">
    </picture>
</p>

<p align="center">
    A getting started guide to self-hosting <a href="https://plausible.io/blog/community-edition">Plausible Community Edition</a>
</p>

---

### Overview
This is an extension to the Plausible Community Edition (CE) for deploying into Azure VM. Providing the required bicep deployment steps.

### Prerequisites
- Have an Azure account (need resource group name) and understand the costs involved with [Azure VMs](https://azure.microsoft.com/en-au/pricing/purchase-options/azure-account)
- Basic understanding of IoC in Azure with [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep)

# 🧵 Insturctions Windows Powershell

Step 1 - clone this repo 
```console
git clone https://github.com/yidaveding/plausible-selfhost.git
```

Step 2 - generate ssh key
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Follow the prompts to save the keys.

```
Start-Service ssh-agent
ssh-add C:\Users\YourUsername\.ssh\id_rsa
Get-Content C:\Users\YourUsername\.ssh\id_rsa.pub
```

Copy the content of the file into a notepad.

Step 3 - create environment file .env
```
SSH_PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EA ...... ve@Dave-Work"
ADMIN_PASSWORD="create_a_password"
```

Step 4 - deploy the infrastructure
```
. .\deploy.ps1
```

Step 5 - Go to [Azure Portal](https://portal.azure.com/) to check the 6 resources are deployed properly.
- Virtual machine
- Network Interface
- Network security group
- Public IP address
- Virtual network
- Disk

Step 6 - find the public IP address and the URL for the VM

Step 7 - ssh into the VM

Step 8 - follow the instructions from Plausible to install and deploy the community edition

