# 3-Tier Environment on Azure

Reference: 
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
https://github.com/hashicorp/terraform-provider-azurerm
https://mariadb.com/kb/en/documentation/

This Terraform configuration deploys a 3-tier environment on Azure cloud. The environment consists of the following tiers:

- Compute: Contains virtual machine resources.
- Database: Contains database resources.
- Networking: Contains virtual network and subnet resources.
- Resource Group: Creates the Azure resource group.
- Security Group: Contains security group resources.

## Prerequisites

- Terraform installed on your machine.
- Azure account(service principle with contributor access) credentials configured and required resources registered in your subscription.

## Usage

1. Clone this repository.
2. Modify the values in `terraform.tfvars` according to your requirements.
3. Run `terraform init` to initialize the Terraform configuration.
4. Run `terraform plan` to see the execution plan.
5. Run `terraform apply` to apply the configuration and deploy the 3-tier environment.

## Clean Up

To clean up and delete all the resources created by this configuration, run `terraform destroy`.

