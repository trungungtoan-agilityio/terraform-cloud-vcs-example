# Learn Terraform Sensitive Input Variables

This project demonstrates how to use Terraform sensitive input variables to securely manage sensitive information like database passwords, API keys, and other confidential data. It deploys a complete web application infrastructure on AWS with a database backend, showcasing proper handling of sensitive values.

## Architecture Overview

This configuration creates a comprehensive AWS infrastructure stack:
- **VPC** with public and private subnets across multiple availability zones
- **Load Balancer** for distributing traffic across EC2 instances
- **EC2 Instances** running web servers in private subnets
- **RDS MySQL Database** with sensitive credentials
- **Security Groups** for network access control
- **Custom Module** for EC2 instance management

## Project Structure

```
learn-terraform-sensitive-variables/
├── main.tf              # Main infrastructure configuration
├── variables.tf         # Input variable declarations (including sensitive ones)
├── outputs.tf           # Output value definitions
├── terraform.tf         # Provider requirements and versions
└── modules/
    └── aws-instance/
        ├── main.tf      # EC2 instance resources
        ├── variables.tf # Module input variables
        └── outputs.tf   # Module output values
```

## Key Components

### Main Infrastructure (main.tf)
- **VPC Module**: Creates networking infrastructure with configurable CIDR blocks
- **Security Groups**: Separate groups for web servers and load balancer
- **Elastic Load Balancer**: Distributes traffic with health checks
- **EC2 Instances**: Deployed via custom module across private subnets
- **RDS Database**: MySQL instance with sensitive credentials

### Custom Module (modules/aws-instance/)
- **Data Source**: Fetches latest Amazon Linux 2 AMI
- **EC2 Instances**: Creates instances with user data for web server setup
- **Variables**: Accepts instance count, type, subnets, and security groups
- **Outputs**: Returns instance IDs for load balancer configuration

## Sensitive Variables Demonstration

### Current Implementation Issues
The configuration currently has a **security anti-pattern** for demonstration purposes:

```hcl
resource "aws_db_instance" "database" {
  username = "admin"
  password = "notasecurepassword"  # ⚠️ NEVER DO THIS!
}
```

### Proper Sensitive Variable Usage
To properly handle sensitive data, you should:

1. **Define sensitive variables**:
```hcl
variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
```

2. **Use them in resources**:
```hcl
resource "aws_db_instance" "database" {
  username = var.db_username
  password = var.db_password
}
```

3. **Mark outputs as sensitive**:
```hcl
output "db_endpoint" {
  description = "Database endpoint"
  value       = aws_db_instance.database.endpoint
  sensitive   = true
}
```

## Variables Configuration

### Infrastructure Variables
- `aws_region`: AWS region (default: us-east-1)
- `vpc_cidr_block`: VPC CIDR block (default: 10.0.0.0/16)
- `public_subnet_cidr_blocks`: List of public subnet CIDRs
- `private_subnet_cidr_blocks`: List of private subnet CIDRs
- `instances_per_subnet`: Number of EC2 instances per subnet (default: 1)
- `instance_type`: EC2 instance type (default: t2.micro)

### Sensitive Variables (To Be Added)
- `db_username`: Database administrator username
- `db_password`: Database administrator password

## Current Configuration

- **Region**: us-east-1
- **VPC CIDR**: 10.0.0.0/16
- **Instance Type**: t2.micro
- **Database**: MySQL 5.7 on db.t3.micro
- **Load Balancer**: Classic ELB with HTTP health checks

## Usage

### Prerequisites
- AWS CLI installed and configured (`aws configure`)
- Terraform installed (version ~1.2.0)

### Deployment Steps

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Plan the deployment**:
   ```bash
   terraform plan
   ```

3. **Apply with sensitive variables**:
   ```bash
   # Using command line (not recommended for production)
   terraform apply -var="db_username=admin" -var="db_password=securepassword123"
   
   # Using environment variables (recommended)
   export TF_VAR_db_username="admin"
   export TF_VAR_db_password="securepassword123"
   terraform apply
   
   # Using terraform.tfvars file (add to .gitignore)
   echo 'db_username = "admin"' >> terraform.tfvars
   echo 'db_password = "securepassword123"' >> terraform.tfvars
   terraform apply
   ```

   or
   ```bash
   # Create a new file called secret.tfvars to assign values to the new variables.
   terraform apply -var-file="secret.tfvars"
   ```

## Security Best Practices

### ✅ Do's
- Use `sensitive = true` for sensitive variables
- Store sensitive values in environment variables or secure vaults
- Use `.tfvars` files for sensitive data (and add to `.gitignore`)
- Implement proper IAM roles and policies
- Enable encryption at rest for databases
- Use AWS Secrets Manager or Parameter Store for production

### ❌ Don'ts
- Never commit sensitive values to version control
- Don't use plain text passwords in configuration files
- Avoid logging sensitive values
- Don't share `.tfvars` files containing secrets

## Terraform State Security

Sensitive values are stored in Terraform state files. Secure your state:

1. **Use remote state backend**:
```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "sensitive-vars/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

2. **Enable state encryption**
3. **Restrict access to state files**
4. **Use state locking**

## Cost Considerations

**Estimated monthly costs (us-east-1)**:
- **EC2 instances (t2.micro)**: ~$8.50 per instance
- **RDS MySQL (db.t3.micro)**: ~$12.50
- **Load Balancer**: ~$18
- **VPC/Networking**: Minimal for basic usage
- **Total**: ~$40-50/month for basic setup

## Clean Up

To destroy the infrastructure:
```bash
terraform destroy
```

**Note**: The RDS instance has `skip_final_snapshot = true` for easy cleanup during learning.

## Learning Objectives

This project demonstrates:
- **Sensitive Variable Declaration**: Using `sensitive = true`
- **Secure Value Passing**: Environment variables and `.tfvars` files
- **Output Sensitivity**: Marking outputs as sensitive
- **State Security**: Protecting sensitive data in state files
- **Security Anti-patterns**: What NOT to do with sensitive data

## Troubleshooting

**Common issues**:
- **Authentication**: Ensure AWS credentials are configured
- **Permissions**: Verify IAM permissions for all resources
- **Sensitive values**: Check environment variables are set correctly
- **State access**: Ensure proper permissions for state backend

**Useful commands**:
```bash
# Check sensitive variables (values will be hidden)
terraform plan

# View non-sensitive outputs only
terraform output

# Refresh state
terraform refresh
```

## Learning Resources

Follow along with the [Learn Terraform Sensitive Input Variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables) tutorial for detailed explanations of sensitive variable concepts and security best practices.
