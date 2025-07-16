# Learn Terraform on Azure: Basic Example

This project demonstrates how to use [Terraform](https://developer.hashicorp.com/terraform) to provision basic Azure resources using Infrastructure as Code (IaC).

## Training Structure

The training examples are organized into four progressive packages:

- `fundamental/` — Basic Terraform and Azure usage (provider, resource group, vnet)
- `intermediate/` — Intermediate concepts (modules, variables, outputs, more resources)
- `advanced/` — Advanced topics (remote state, workspaces, security, complex modules)
- `capstone/` — Capstone project combining all concepts in a real-world scenario

Each package contains its own Terraform configuration and README.

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

2. **Choose a training state:**
   ```sh
   cd fundamental
   # or cd intermediate, advanced, capstone
   ```

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Review the execution plan:**
   ```sh
   terraform plan
   ```

5. **Apply the configuration:**
   ```sh
   terraform apply
   ```
   Confirm with `yes` when prompted.

6. **View outputs:**
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