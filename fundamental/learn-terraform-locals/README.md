# Learn Terraform Locals

This project demonstrates how to use Terraform local values to simplify configuration, reduce repetition, and improve readability. It deploys a scalable web application infrastructure on AWS, showcasing how locals can create consistent naming conventions and computed values throughout your configuration.

## Architecture Overview

This configuration creates a comprehensive AWS infrastructure stack:
- **VPC** with configurable public and private subnets across multiple availability zones
- **Load Balancer** for distributing traffic across EC2 instances
- **EC2 Instances** running web servers in private subnets
- **Security Groups** for network access control with consistent naming
- **NAT Gateway** for outbound internet access from private subnets

## Project Structure

```
learn-terraform-locals/
├── main.tf              # Main infrastructure configuration with locals
├── variables.tf         # Input variable declarations
├── outputs.tf           # Output value definitions
├── terraform.tf         # Provider requirements and versions
└── README.md           # Project documentation
```

## Local Values Demonstration

### Key Local Value Usage

The configuration demonstrates locals through consistent naming:

```hcl
locals {
  name_suffix = "${var.resource_tags["project"]}-${var.resource_tags["environment"]}"
}
```

This local value is used throughout the configuration to create consistent resource names:
- **VPC**: `vpc-${locals.name_suffix}`
- **Security Groups**: `web-sg-${locals.name_suffix}`, `lb-sg-${locals.name_suffix}`
- **Load Balancer**: `lb-${locals.name_suffix}`

### Benefits Demonstrated

1. **Consistency**: All resources follow the same naming pattern
2. **Maintainability**: Change the naming convention in one place
3. **Readability**: Clear, meaningful names instead of repeated expressions
4. **DRY Principle**: Don't Repeat Yourself - define once, use everywhere

## Key Components

### Infrastructure Resources
- **VPC Module**: Creates networking infrastructure with configurable subnets
- **Security Groups**: Separate groups for web servers and load balancer
- **Elastic Load Balancer**: Distributes traffic with health checks
- **EC2 Instances**: Amazon Linux 2 instances with Apache web server
- **Data Sources**: Fetches availability zones and latest AMI

### Local Values Usage Examples

```hcl
# Instead of repeating this expression:
name = "${var.resource_tags["project"]}-${var.resource_tags["environment"]}"

# Define it once as a local:
locals {
  name_suffix = "${var.resource_tags["project"]}-${var.resource_tags["environment"]}"
}

# Then use it everywhere:
name = "vpc-${locals.name_suffix}"
name = "web-sg-${locals.name_suffix}"
name = "lb-sg-${locals.name_suffix}"
```

## Variables Configuration

### Infrastructure Variables
- `aws_region`: AWS region (default: us-east-2)
- `vpc_cidr_block`: VPC CIDR block (default: 10.0.0.0/16)
- `instance_count`: Number of EC2 instances (default: 2)
- `ec2_instance_type`: EC2 instance type (default: t2.micro)

### Network Configuration
- `public_subnet_count`: Number of public subnets (default: 2)
- `private_subnet_count`: Number of private subnets (default: 2)
- `public_subnet_cidr_blocks`: Available CIDR blocks for public subnets
- `private_subnet_cidr_blocks`: Available CIDR blocks for private subnets
- `enable_vpn_gateway`: Enable VPN gateway (default: false)

### Tagging and Naming
- `resource_tags`: Map of tags applied to all resources
  - `project`: "my-project" (used in naming)
  - `environment`: "dev" (used in naming)

## Current Configuration

- **Region**: us-east-2
- **VPC CIDR**: 10.0.0.0/16
- **Instance Count**: 2 EC2 instances
- **Instance Type**: t2.micro
- **Project Name**: my-project
- **Environment**: dev
- **Naming Pattern**: `{resource-type}-my-project-dev`

## Usage

### Prerequisites
- AWS CLI installed and configured (`aws configure`)
- Terraform installed (version >= 1.1)

### Deployment Steps

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

### Customizing with Variables

You can customize the deployment by overriding variables:

```bash
# Change project and environment names
terraform apply -var='resource_tags={"project"="web-app","environment"="prod"}'

# Adjust instance count
terraform apply -var="instance_count=4"

# Change instance type
terraform apply -var="ec2_instance_type=t3.small"
```

## Local Values Best Practices

### When to Use Locals

1. **Repeated Expressions**: When the same expression appears multiple times
2. **Complex Calculations**: For computed values used in multiple places
3. **Naming Conventions**: To ensure consistent resource naming
4. **Conditional Logic**: For complex conditional expressions

### Examples of Good Local Usage

```hcl
locals {
  # Naming convention
  name_suffix = "${var.project}-${var.environment}"
  
  # Complex conditional
  instance_type = var.environment == "prod" ? "t3.large" : "t2.micro"
  
  # Computed values
  total_subnets = var.public_subnet_count + var.private_subnet_count
  
  # Common tags
  common_tags = merge(var.resource_tags, {
    ManagedBy = "Terraform"
    CreatedAt = timestamp()
  })
}
```

## Outputs

- `public_dns_name`: DNS name of the load balancer for accessing the web application

## Cost Considerations

**Estimated monthly costs (us-east-2)**:
- **EC2 instances (t2.micro)**: ~$8.50 per instance
- **Load Balancer**: ~$18
- **NAT Gateway**: ~$32 (if enabled)
- **VPC/Networking**: Minimal for basic usage
- **Total**: ~$35-70/month depending on configuration

## Clean Up

To destroy the infrastructure:
```bash
terraform destroy
```

## Learning Objectives

This project demonstrates:
- **Local Value Declaration**: How to define and use locals
- **Naming Consistency**: Using locals for consistent resource naming
- **Code Reusability**: Reducing repetition with computed values
- **Configuration Simplification**: Making complex expressions more readable
- **Best Practices**: When and how to use locals effectively

## Advanced Local Usage

For more complex scenarios, you might use locals for:

```hcl
locals {
  # Environment-specific configurations
  environment_config = {
    dev = {
      instance_type = "t2.micro"
      instance_count = 2
    }
    prod = {
      instance_type = "t3.large"
      instance_count = 4
    }
  }
  
  # Current environment settings
  current_config = local.environment_config[var.environment]
  
  # Conditional resource creation
  create_nat_gateway = var.environment == "prod" ? true : false
}
```

## Troubleshooting

**Common issues**:
- **Authentication**: Ensure AWS credentials are configured
- **Permissions**: Verify IAM permissions for all resources
- **Region availability**: Some instance types may not be available in all regions
- **Local references**: Ensure locals are defined before being referenced

**Useful commands**:
```bash
# Check local values in plan
terraform plan

# View current configuration
terraform show

# Validate configuration
terraform validate
```

## Learning Resources

Follow along with the [Learn Terraform Locals](https://developer.hashicorp.com/terraform/tutorials/configuration-language/locals) tutorial for detailed explanations of local values concepts and best practices. 
