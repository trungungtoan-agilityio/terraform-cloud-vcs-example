# Deploy, Manage, and Scale a NodeJS Application on Heroku

This is a companion repository to the ["Deploy, Manage, and Scale a NodeJS Application on Heroku" tutorial](https://developer.hashicorp.com/terraform/tutorials/applications/heroku-provider).

## Project Structure

```
learn-terraform-heroku/
├── main.tf            # Main infrastructure configuration
├── output.tf          # Output value definitions
├── versions.tf        # Provider and Terraform version requirements
├── app/               # NodeJS application source code
└── README.md          # Project documentation
```

## Variables

- `app_quantity` (number, default: 1): Number of dynos (web processes) to run for your Heroku app.

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

- `app_url`: The URL of your deployed Heroku application.

## Clean Up
To destroy all resources created by this configuration:
```sh
terraform destroy
```

## References
- [Terraform Heroku Provider Documentation](https://registry.terraform.io/providers/heroku/heroku/latest/docs)
- [Deploy, Manage, and Scale a NodeJS Application on Heroku Tutorial](https://developer.hashicorp.com/terraform/tutorials/applications/heroku-provider)
