# Simple Azure Virtual Machine
This module deploys a simple Azure Virtual Machine on a custom subnet in a custom
Virtual Network.

The module assumes that the Az CLI has been installed and configured according to the
instructions at [https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt).

For simplicity, it is recommended that you opt for the single command method described in the documentation:

```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

Next, you will need to authenticate with Microsoft Azure using `az login` as described in [https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli).

## How to Deploy the Module Stand-Alone

Make a copy of `terraform.tfvars.example` using the following command:

```
cp terraform.tfvars.example terraform.tfvars
```

And then edit it as appropriate for your Azure configuration.

To deploy the Azure Virtual Machine, run the following commands _in the azure directory_:

```
terraform init
terraform apply
```
