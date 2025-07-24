# Learn Terraform - Deploy Federated Multi-Cloud Kubernetes Clusters

This is a companion repository for the [Deploy Federated Multi-Cloud Kubernetes Clusters tutorial](https://developer.hashicorp.com/terraform/tutorials/networking/multicloud-kubernetes). It contains Terraform configuration files to help you learn how to deploy a Consul-federated multi-cluster Kubernetes setup across AWS (EKS) and Azure (AKS).

## Project Structure

```
learn-terraform-multicloud-kubernetes/
├── aks/                # Azure Kubernetes Service (AKS) cluster configuration
├── eks/                # Amazon EKS cluster configuration
├── consul/             # Consul federation and service mesh configuration
├── counting-service/   # Sample application deployment
└── README.md           # Project documentation
```

## Subdirectories

- **aks/**: Deploys an AKS cluster on Azure using Terraform.
- **eks/**: Deploys an EKS cluster on AWS using Terraform.
- **consul/**: Sets up Consul federation and service mesh across clusters.
- **counting-service/**: Deploys a sample counting service application to demonstrate cross-cluster service discovery.

## Usage

Each subdirectory contains its own Terraform configuration and README or usage instructions. To deploy a specific component, navigate to the corresponding directory and follow the standard Terraform workflow:

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

## Clean Up
To destroy all resources created by a configuration:
```sh
terraform destroy
```

## References
- [Deploy Federated Multi-Cloud Kubernetes Clusters Tutorial](https://developer.hashicorp.com/terraform/tutorials/networking/multicloud-kubernetes)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Consul Service Mesh Documentation](https://www.consul.io/docs/connect)
