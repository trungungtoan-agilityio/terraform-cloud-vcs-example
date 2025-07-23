# Learn Terraform Expressions

Learn what Terraform expressions are and when to use them.

Follow along with the [Hashicorp tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/expressions).

## Project Structure

```
learn-terraform-expressions/
├── main.tf            # Main infrastructure configuration
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value definitions
├── terraform.tf       # Provider requirements and versions
└── README.md          # Project documentation
```

## Variables

- `cidr_vpc` (string, default: "172.16.0.0/16"): CIDR block for the VPC.
- `cidr_subnet` (string, default: "172.16.10.0/24"): CIDR block for the subnet.
- `aws_region` (string, default: "us-east-2"): The AWS region to deploy your instance.
- `name` (string, default: "terraform"): The username assigned to the infrastructure.
- `team` (string, default: "hashicorp"): The team responsible for the infrastructure.
- `high_availability` (bool, default: true): If true, deploys 3 instances; otherwise, deploys 1.

## Expressions Usage

This configuration demonstrates the use of Terraform expressions, including:
- Conditional expressions (e.g., `var.high_availability == true ? 3 : 1`)
- Local values for computed logic
- String interpolation and merging maps
- Resource meta-arguments (e.g., `count`, `tags`)
- Dynamic referencing of resource attributes (e.g., `aws_instance.ubuntu[*].id`)

Refer to the [Terraform Expressions documentation](https://developer.hashicorp.com/terraform/language/expressions) for more details.

## Data Sources

- `aws_ami`: Fetches the latest Ubuntu AMI for EC2 instances based on filters.

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

- `tags`: Instance tags for all EC2 instances.
- `private_addresses`: Private DNS for AWS instances.
- `first_tags`: Instance tags for the first instance.

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Terraform Expressions Documentation](https://developer.hashicorp.com/terraform/language/expressions)
- [Learn Terraform Expressions Tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/expressions)
