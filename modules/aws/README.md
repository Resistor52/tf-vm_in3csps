# Simple AWS Virtual Machine
This module deploys a simple EC2 Virtual Machine on a custom subnet in a custom
VPC.

The module assumes that the AWS CLI has been installed and configured on a Linux
system. To do so, use the following commands:

```
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
sudo unzip /tmp/awscliv2.zip -d /tmp
sudo /tmp/aws/install
```

Next, configure the AWS CLI with your AWS Access Key as described in [https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

## How to Deploy the Module Stand-Alone

Make a copy of `terraform.tfvars.example` using the following command:

```
cp terraform.tfvars.example terraform.tfvars
```

And then edit it as appropriate for your AWS configuration.

To deploy the EC2 Instance, run the following commands _in the aws directory_:

```
terraform init
terraform apply
```
