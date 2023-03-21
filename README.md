# Kubernetes Authentication using kubelogin

This repository contains Terraform configuration files for generating kubeconfig files with various non-interactive authentication methods using kubelogin. These methods are suitable for automation scenarios.

## Terraform Configuration Files

### kubelogin-cli-token.tf

Generates a kubeconfig file for Azure CLI token login. Users will be authenticated using their Azure CLI credentials.

### kubelogin-msi-specific-id.tf

Generates a kubeconfig file for Managed Service Identity (MSI) with a specific client ID. The configuration uses the specified MSI app ID for authentication.

### kubelogin-msi.tf

Generates a kubeconfig file for Managed Service Identity (MSI). The configuration uses the default MSI for authentication.

### kubelogin-sp-certificate.tf

Generates a kubeconfig file for Service Principal login with a PFX certificate. Users will be authenticated using a Service Principal and a client certificate.

### kubelogin-sp-secret.tf

Generates a kubeconfig file for Service Principal login with a client secret. Users will be authenticated using a Service Principal and a client secret.

### kubelogin-workload-id.tf

Generates a kubeconfig file for Workload Identity. Users will be authenticated using Workload Identity.

## Usage

1. Clone the repository.
2. Update the Terraform configuration files with your specific Azure and Kubernetes settings.
3. Run `terraform init` to initialize the Terraform backend and download the required providers.
4. Run `terraform apply` to create the kubeconfig files.
5. The output will display the YAML content of the generated kubeconfig files. Save each output to a separate file for use with `kubectl`.
