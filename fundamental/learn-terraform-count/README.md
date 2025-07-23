# Learn Terraform Count

Learn how to provision multiple resources with Terraform count.

Follow along with [this tutorial on HashiCorp Learn](https://learn.hashicorp.com/tutorials/terraform/count).

## Project Structure

```
learn-terraform-count/
├── main.tf            # Main infrastructure configuration
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value definitions
├── terraform.tf       # Provider requirements and versions
└── README.md          # Project documentation
```

## Variables

- `aws_region` (string, default: "us-east-2"): AWS region for all resources.
- `project_name` (string, default: "client-webapp"): Name of the project. Used in resource names and tags.
- `environment` (string, default: "dev"): Value of the 'Environment' tag.
- `public_subnets_per_vpc` (number, default: 2): Number of public subnets. Maximum of 16.
- `private_subnets_per_vpc` (number, default: 2): Number of private subnets. Maximum of 16.
- `instance_type` (string, default: "t2.micro"): Type of EC2 instance to use.
- `vpc_cidr_block` (string, default: "10.0.0.0/16"): CIDR block for VPC.
- `public_subnet_cidr_blocks` (list(string)): Available CIDR blocks for public subnets.
- `private_subnet_cidr_blocks` (list(string)): Available CIDR blocks for private subnets.

## Count Usage

This configuration demonstrates the use of the `count` meta-argument to provision multiple resources efficiently. For example, you can use `count` to create multiple EC2 instances, subnets, or other resources with a single resource block, reducing repetition and improving maintainability.

## Data Sources

- `aws_availability_zones`: Retrieves a list of available AWS availability zones in the selected region. Used to dynamically configure VPC and subnet resources.
- `aws_ami`: Fetches the latest Amazon Linux 2 AMI for EC2 instances.

## Usage

1. **Initialize Terraform:**
   ```sh
   terraform init
   ```
2. **Plan the deployment:**
   ```sh
   terraform plan
   ```
3. **Apply the configuration:**
   ```sh
   terraform apply
   ```
   Confirm with `yes` when prompted.
4. **View outputs:**
   ```sh
   terraform output
   ```

## Outputs

After applying the configuration, Terraform will provide the following outputs:

- `public_dns_name`: Public DNS name of the load balancer.
- `vpc_arn`: ARN of the VPC.
- `instance_ids`: IDs of the EC2 instances.

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Terraform Count Documentation](https://developer.hashicorp.com/terraform/language/meta-arguments/count)
- [Learn Terraform Count Tutorial](https://learn.hashicorp.com/tutorials/terraform/count)
