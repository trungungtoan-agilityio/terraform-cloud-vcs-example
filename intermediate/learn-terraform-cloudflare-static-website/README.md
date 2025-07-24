# Learn Terraform Cloudflare Static Website

Learn how to deploy a static website using AWS S3 for storage and Cloudflare for DNS and CDN. This example demonstrates how to provision an S3 bucket for website hosting, configure public access, and set up Cloudflare DNS records for your custom domain.

## Project Structure

```
learn-terraform-cloudflare-static-website/
├── main.tf            # Main infrastructure configuration
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value definitions
├── terraform.tf       # Provider requirements and versions
├── terraform.tfvars   # Example variable values
├── website/           # Static website content
└── README.md          # Project documentation
```

## Variables

- `aws_region` (string, default: "us-east-1"): The AWS region to put the bucket into.
- `site_domain` (string): The domain name to use for the static site.

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

- `website_bucket_name`: Name (id) of the S3 bucket.
- `bucket_endpoint`: The S3 website endpoint URL.
- `domain_name`: The custom domain name for your static website.

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Terraform AWS S3 Bucket Website Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)
- [Terraform Cloudflare Provider Documentation](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)
