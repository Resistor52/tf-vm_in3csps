# tf-vm_in3csps

## Demonstration of Terraform Modules; Deploy a VM in AWS, Azure and GCP at once

This repository is the terraform source code that accompanies [Head in the Clouds, Episode 10](https://headintheclouds.site/episodes/episode10). The purpose of the source code is to demonstrate how to use
modules in Terraform.

This repository includes three modules: "aws," "azure," and "gcp." Each module deploys a virtual
machine in its respective cloud. Each module can be deployed in a standalone manner by following the
instructions in the README for that module.

To deploy all three modules at once, copy the `terraform.tfvars.example` using the following command:

```
cp terraform.tfvars.example terraform.tfvars
```

And then edit `terraform.tfvars` as appropriate for your configurations with all three cloud service
providers (CSP).

**NOTE:** It is assumed that you have configured authentication for each CSP as described in the
README.md file for each module.

To deploy the EC2 Instance, run the following commands _in the repository root directory_:

```
terraform init
terraform apply
```

## Demonstration Video

For a video that demonstrates this, checkout [Head in the Clouds, Episode 10](https://headintheclouds.site/episodes/episode10).

## Troubleshooting

If you are having an issue, it is most likely a problem with your `terraform.tfvars` file.

## Additional Resources

I have created two additional resources that this repo builds on and I consider them to
contain prerequisite knowledge:

* [Use Terraform to Provision Your Own Cloud Based Remote Browsing Workstation](https://youtu.be/5L6yxXXn0-I) -
This is a 90 minute SANS Tech Tuesday workshop and is essentially a tutorial on using both Terraform and Github
to create a configured AWS Elastic Compute Instance.
* [Head in the Clouds Episode 4 - Use Terraform to Provision a Google Compute instance](https://headintheclouds.site/episodes/episode4) - This is an earlier episode of Head in the Clouds where I cover the details of using Terraform to deploy a virtual machine to Google Cloud Platform.
