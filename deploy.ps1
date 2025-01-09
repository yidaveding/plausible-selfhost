# Load environment variables from .env file
if (Test-Path .env) {
    Get-Content .env | ForEach-Object {
        if ($_ -match '^(.+)=(.+)$') {
            $key = $matches[1]
            $value = $matches[2]
            [System.Environment]::SetEnvironmentVariable($key, $value)
        }
    }
}

# Deploy the Bicep file using Azure CLI
az deployment group create --resource-group fdplausibledemo --template-file main.bicep --parameters sshPublicKey=$env:SSH_PUBLIC_KEY adminPassword=$env:ADMIN_PASSWORD