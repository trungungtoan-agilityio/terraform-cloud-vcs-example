# Learn Terraform Outputs

This repo is a companion to the [Learn Terraform outputs](https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs) tutorial. It contains Terraform configuration you can use to learn how Terraform output values allow you to export structured data about your resources.

## Project Structure

```
learn-terraform-outputs/
├── main.tf            # Main infrastructure configuration
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value definitions
├── terraform.tf       # Provider requirements and versions
└── README.md          # Project documentation
```

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.1.0
- AWS CLI installed and configured (`aws configure`)
- An AWS account with sufficient permissions

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

- `vpc_id`: ID of the project VPC.
- `lb_url`: URL of the load balancer (e.g., http://<elb_dns_name>/).
- `web_server_count`: Number of web servers provisioned.
- `db_username` (sensitive): Database administrator username.
- `db_password` (sensitive): Database administrator password.

Sensitive outputs will be hidden by default in the CLI output. To view sensitive values, use:
```sh
terraform output db_username
terraform output db_password
```

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Terraform Output Values Documentation](https://developer.hashicorp.com/terraform/language/values/outputs)
- [Learn Terraform Outputs Tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs)
