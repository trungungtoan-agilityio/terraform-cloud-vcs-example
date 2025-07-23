# Learn Terraform Functions

Learn what Terraform functions are and how to use them.

Follow along with the [Hashicorp tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/functions).

## Project Structure

```
learn-terraform-functions/
├── main.tf            # Main infrastructure configuration
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value definitions
├── terraform.tf       # Provider requirements and versions
├── user_data.tftpl    # User data template
└── README.md          # Project documentation
```

## Variables

- `cidr_vpc` (string, default: "10.1.0.0/16"): CIDR block for the VPC.
- `cidr_subnet` (string, default: "10.1.0.0/24"): CIDR block for the subnet.
- `environment_tag` (string, default: "Learn"): Environment tag.
- `aws_region` (string, default: "us-east-1"): The AWS region to deploy your instance.
- `user_name` (string, default: "terraform"): The user creating this infrastructure.
- `user_department` (string, default: "learn"): The organization the user belongs to: dev, prod, qa.

## Functions Usage

This configuration demonstrates the use of various Terraform built-in functions, such as:
- String interpolation (e.g., `${aws_instance.web.public_ip}:8080`)
- Data source filtering (e.g., using filters in `data "aws_ami"`)
- Default values and variable usage
- Tagging and dynamic resource configuration

Refer to the [Terraform Functions documentation](https://developer.hashicorp.com/terraform/language/functions) for a full list of available functions.

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

- `web_public_address`: The public IP address and port (8080) of the web server instance.
- `web_public_ip`: The public IP address of the web server instance.

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Terraform Functions Documentation](https://developer.hashicorp.com/terraform/language/functions)
- [Learn Terraform Functions Tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/functions)
