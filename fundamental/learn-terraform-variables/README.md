# Learn Terraform Variables

This project demonstrates how to use Terraform variables to create reusable and customizable infrastructure configurations. It deploys a scalable web application infrastructure on AWS using modules and variables.

## Architecture Overview

This configuration creates:
- **VPC** with public and private subnets across multiple availability zones
- **Load Balancer** for distributing traffic across EC2 instances
- **EC2 Instances** running a simple web server in private subnets
- **Security Groups** for network access control
- **Custom Module** for EC2 instance management

## Project Structure

```
learn-terraform-variables/
├── main.tf              # Main configuration with module calls
├── variables.tf         # Input variable declarations
├── outputs.tf           # Output value definitions
├── terraform.tf         # Provider and version requirements
└── modules/
    └── aws-instance/
        ├── main.tf      # EC2 instance resources
        ├── variables.tf # Module input variables
        └── outputs.tf   # Module output values
```

## Key Components

### Main Infrastructure (main.tf)
- **VPC Module**: Creates networking infrastructure with public/private subnets
- **Security Groups**: Web security groups for application and load balancer
- **Elastic Load Balancer**: Distributes traffic across EC2 instances
- **EC2 Instances**: Custom module deployment with configurable count

### Custom Module (modules/aws-instance/)
- **Data Source**: Fetches latest Amazon Linux 2 AMI
- **EC2 Instances**: Creates specified number of instances with user data
- **Variables**: Accepts instance count, type, subnets, and security groups
- **Outputs**: Returns instance IDs for use by other resources

## Variables Used

### Root Module Variables
Currently defined in `variables.tf` (ready for customization):
- Add variables for instance count, type, environment, project name, etc.

### Module Variables
The `aws-instance` module accepts:
- `instance_count`: Number of EC2 instances to deploy
- `instance_type`: EC2 instance type (currently t2.micro)
- `subnet_ids`: List of subnet IDs for instance placement
- `security_group_ids`: List of security group IDs
- `tags`: Map of tags to apply to instances

## Current Configuration

The infrastructure is currently configured with:
- **Region**: us-west-2
- **Instance Count**: 2 EC2 instances
- **Instance Type**: t2.micro
- **Project**: project-alpha
- **Environment**: dev
- **VPC CIDR**: 10.0.0.0/16

## Usage

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Plan the deployment**:
   ```bash
   terraform plan
   ```

3. **Apply the configuration**:
   ```bash
   terraform apply
   ```

4. **Access the application**:
   The load balancer DNS name will be output after deployment.

## Outputs

- `public_dns_name`: DNS name of the load balancer for accessing the web application

## Next Steps for Variables

To make this configuration more flexible, consider adding these variables to `variables.tf`:

```hcl
variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "project-alpha"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
```

## Clean Up

To destroy the infrastructure:
```bash
terraform destroy
```

## Learning Resources

Follow along with the [Learn Terraform Variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables) tutorial for detailed explanations of variable concepts and best practices.
