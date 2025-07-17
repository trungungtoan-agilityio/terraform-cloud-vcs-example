# Learn Terraform Resources

This project demonstrates how to use Terraform to create and manage Azure cloud resources. It deploys a complete web server infrastructure including networking, security, and compute resources on Microsoft Azure.

## Architecture Overview

This configuration creates a complete Azure infrastructure stack:
- **Resource Group** - Container for all Azure resources
- **Virtual Network & Subnet** - Network infrastructure for secure communication
- **Public IP Address** - External access point for the web server
- **Network Security Group** - Firewall rules for HTTP and SSH access
- **Network Interface** - Connects the VM to the network and public IP
- **Virtual Machine** - Ubuntu 20.04 LTS server running a web application

## Project Structure

```
learn-terraform-resources/
├── main.tf              # Main infrastructure configuration
├── terraform.tf         # Provider requirements and versions
├── outputs.tf           # Output values (IP, DNS, URLs)
├── init-script.sh       # VM provisioning script
└── README.md           # Project documentation
```

## Key Resources

### Networking Components
- **Virtual Network**: `10.0.0.0/16` address space in West US 2
- **Subnet**: `10.0.2.0/24` for VM placement
- **Public IP**: Dynamic allocation for external access
- **Network Security Group**: Allows HTTP (port 80) and SSH (port 22)

### Compute Resources
- **Virtual Machine**: `Standard_A1_v2` (1 vCPU, 2GB RAM)
- **Operating System**: Ubuntu 20.04 LTS
- **Storage**: 30GB Standard HDD managed disk
- **Authentication**: Username/password (testadmin)

### Unique Naming
- Uses `random_pet` resource to generate unique names
- All resources prefixed with random pet name (e.g., `rg-happy-dog`)

## Provisioning Script (init-script.sh)

The initialization script automatically:
1. Updates the system packages
2. Installs Apache HTTP server, PHP, and MySQL
3. Configures Apache to start on boot
4. Sets proper file permissions for web content
5. Creates a sample web page showing instance metadata
6. Downloads a sample PHP application (Terramino game)

## Current Configuration

- **Region**: West US 2
- **VM Size**: Standard_A1_v2 (cost-optimized for testing)
- **OS**: Ubuntu 20.04 LTS (latest)
- **Disk**: Standard LRS managed disk
- **Network**: Private subnet with public IP access
- **Security**: HTTP and SSH access allowed

## Usage

### Prerequisites
- Azure CLI installed and authenticated (`az login`)
- Terraform installed (version ~1.2.0)

### Deployment Steps

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Review the plan**:
   ```bash
   terraform plan
   ```

3. **Deploy the infrastructure**:
   ```bash
   terraform apply
   ```

4. **Access your web application**:
   After deployment, use the output URLs to access your application.

### Accessing the Application

The configuration provides three outputs:
- **Public IP**: Direct IP address of the VM
- **Domain Name**: FQDN if available
- **Application URL**: Direct link to the PHP application

Example access:
```bash
# Get the public IP
terraform output public-ip

# Access the web server
curl http://[PUBLIC-IP]/index.html
curl http://[PUBLIC-IP]/index.php
```

## Outputs

- `public-ip`: The public IP address of the virtual machine
- `domain-name`: The fully qualified domain name (if available)
- `application-url`: Direct URL to access the PHP application

## Cost Considerations

**Estimated costs (West US 2 region)**:
- **VM (Standard_A1_v2)**: ~$32/month if running 24/7
- **Storage (30GB Standard HDD)**: ~$1.50/month
- **Public IP**: ~$3.65/month
- **Network**: Minimal for basic usage

**Cost-saving tips**:
- Stop/deallocate VM when not in use
- Use `terraform destroy` to remove all resources after testing
- Monitor usage through Azure Cost Management

## Security Features

- **Network Security Group**: Restricts access to HTTP and SSH only
- **Private Subnet**: VM placed in private network space
- **Managed Identity**: Can be configured for secure Azure service access
- **SSH Access**: Available for administrative tasks

## Clean Up

To avoid ongoing charges, destroy the infrastructure when done:
```bash
terraform destroy
```

This will remove all created resources including the resource group.

## Learning Resources

This project follows the [Learn Terraform Resources](https://developer.hashicorp.com/terraform/tutorials/configuration-language) tutorial. Key concepts demonstrated:

- **Resource Dependencies**: How resources reference each other
- **Data Sources**: Using random_pet for unique naming
- **Provisioning**: Using custom_data for VM initialization
- **Outputs**: Exposing important values after deployment
- **Provider Configuration**: Azure provider setup and authentication

## Troubleshooting

**Common issues**:
- **Authentication**: Ensure `az login` is completed
- **Permissions**: Verify Azure subscription permissions
- **Region availability**: Some VM sizes may not be available in all regions
- **Naming conflicts**: Random pet names should prevent conflicts

**Useful commands**:
```bash
# Check Terraform state
terraform show

# View specific output
terraform output public-ip

# Refresh state
terraform refresh
```
