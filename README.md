# Learn Terraform on Azure: Basic Example

This project demonstrates how to use [Terraform](https://developer.hashicorp.com/terraform) to provision basic Azure resources using Infrastructure as Code (IaC).

## Contents

- `main.tf` — Main Terraform configuration (Azure provider, resource group, virtual network)
- `variables.tf` — Input variables for customization (resource group name, location)
- `outputs.tf` — Output values (resource group and virtual network IDs)

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.1.0
- An [Azure account](https://portal.azure.com/)
- Azure CLI authenticated (`az login`)

## Usage

1. **Clone this repository** (if not already):
   ```sh
   git clone <your-repo-url>
   cd learn-terraform-azure
   ```

2. **Initialize Terraform:**
   ```sh
   terraform init
   ```

3. **Review the execution plan:**
   ```sh
   terraform plan
   ```

4. **Apply the configuration:**
   ```sh
   terraform apply
   ```
   Confirm with `yes` when prompted.

5. **View outputs:**
   ```sh
   terraform output
   ```

## Customization

You can override variables at apply time, for example:
```sh
terraform apply -var="location=eastus" -var="resource_group_name=customRG"
```
Or edit `variables.tf` to change defaults.

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Terraform Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform CLI Tutorials](https://developer.hashicorp.com/terraform/tutorials/cli) 