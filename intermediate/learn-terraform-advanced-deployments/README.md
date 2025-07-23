# Learn Terraform Advanced Deployment Strategies

Learn how to use Terraform and AWS's Application Load Balancers for canary tests and blue/green deployments. Learn how to add feature flags to your Terraform configuration by using variables and conditionals. Follow along with [this tutorial](https://learn.hashicorp.com/tutorials/terraform/blue-green-canary-tests-deployments) on HashiCorp Learn.

## Project Structure

```
learn-terraform-advanced-deployments/
├── main.tf            # Main infrastructure configuration
├── blue.tf            # Blue environment resources
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value definitions
├── terraform.tf       # Provider requirements and versions
├── init-script.sh     # Initialization script for instances
└── README.md          # Project documentation
```

## Variables

- `region` (string, default: "us-west-2"): The AWS region for deployment.
- `vpc_cidr_block` (string, default: "10.0.0.0/16"): CIDR block for the VPC.
- `enable_vpn_gateway` (bool, default: false): Enable a VPN gateway in your VPC.
- `public_subnet_count` (number, default: 2): Number of public subnets.
- `private_subnet_count` (number, default: 2): Number of private subnets.
- `public_subnet_cidr_blocks` (list(string)): Available CIDR blocks for public subnets.
- `private_subnet_cidr_blocks` (list(string)): Available CIDR blocks for private subnets.
- `enable_blue_env` (bool, default: true): Enable blue environment.
- `blue_instance_count` (number, default: 2): Number of instances in blue environment.
- `enable_green_env` (bool, default: true): Enable green environment.
- `green_instance_count` (number, default: 2): Number of instances in green environment.
- `traffic_distribution` (string): Levels of traffic distribution (e.g., blue, blue-90, split, green-90, green).

## Advanced Deployment Strategies

This configuration demonstrates advanced deployment strategies using Terraform and AWS:
- **Blue/Green Deployments:** Deploy two separate environments (blue and green) and control traffic between them using feature flags and variables.
- **Canary Tests:** Gradually shift traffic between environments for safer rollouts.
- **Feature Flags:** Use variables and conditionals to enable or disable environments and control traffic distribution.

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

After applying the configuration, Terraform will provide the following output:

- `lb_dns_name`: The DNS name of the Application Load Balancer.

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Blue/Green and Canary Deployments with Terraform](https://learn.hashicorp.com/tutorials/terraform/blue-green-canary-tests-deployments)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
