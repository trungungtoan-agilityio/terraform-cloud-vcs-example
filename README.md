# Learn Terraform on Azure: Training Packages

This project demonstrates how to use [Terraform](https://developer.hashicorp.com/terraform) to provision Azure resources, organized into progressive training packages.

## Training Structure

The training examples are organized into four progressive packages:

- `fundamental/` — Basic Terraform and Azure usage (provider, resource group, vnet)
- `intermediate/` — Intermediate concepts (modules, variables, outputs, more resources)
- `advanced/` — Advanced topics (remote state, workspaces, security, complex modules)
- `capstone/` — Capstone project combining all concepts in a real-world scenario

Each package contains its own Terraform configuration and README.

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

3. **Follow the README in each package for instructions.**

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.1.0
- An [Azure account](https://portal.azure.com/)
- Azure CLI authenticated (`az login`)

## References
- [Terraform Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform CLI Tutorials](https://developer.hashicorp.com/terraform/tutorials/cli) 