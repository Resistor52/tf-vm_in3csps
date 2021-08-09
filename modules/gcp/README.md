# Simple GCP Virtual Machine
This module deploys a simple Compute Engine Virtual Machine on a custom subnet in a custom
VPC.

The module assumes that you have created a GCP project and Service Account as described in [https://headintheclouds.site/episodes/episode4](https://headintheclouds.site/episodes/episode4)

## How to Deploy the Module Stand-Alone

Make a copy of `terraform.tfvars.example` using the following command:

```
cp terraform.tfvars.example terraform.tfvars
```

And then edit it as appropriate for your AWS configuration.

To deploy the EC2 Instance, run the following commands _in the gcp directory_:

```
terraform init
terraform apply
```
