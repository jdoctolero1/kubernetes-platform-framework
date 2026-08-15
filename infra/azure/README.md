# Azure Platform Infrastructure

This directory contains Terraform (`.tf`) files to provision the foundational Azure infrastructure required for a Kubernetes cluster. The resources created include:

- **Resource Group**: The resource group to contain the Kubernetes resources.
- **Kubernetes Control Plane Node**: The control plane node for the Kubernetes cluster.
- **Kubernetes Worker Nodes**: Nodes that run your containerized workloads.
- **Application Gateway**: Layer 7 (application) load balancer that provides secure HTTPS connections to your Kubernetes cluster. 
- **Public IP Address**: Public IP address to be attached to the Application Gateway.
- **Public A Record**: DNS A record that binds to the public IP address created for the Application Gateway.

## Prerequisites
- An Azure Blob container for usage as a Terraform backend.
- Create an id_rsa.pub file for your ssh key in the ./files directory. This will allow you to ssh into your VMs.

## Required Components
- The VNet and Subnets that the VMs will reside in are already provisioned.
- Key vault with an existing SSL certificate.
- Public DNS zone to save A record for the Application Gateway's public IP.
- Managed Identity for the Application Gateway to use in order to access key vault.

## Terraform Workspaces
It is highly encouraged to use a Terraform workspace to manage your environments.

For more information on Terraform workspaces, see the [official documentation](https://developer.hashicorp.com/terraform/language/state/workspaces).

## Sample .tfvars and backend.hcl files
Use the sample tfvars file under ./environments/sample-lab.tfvars. Update the values for your Azure environment and save the file as lab.tfvars.

Use the sample-backend.hcl file for saving your Terraform state file to Azure Blobs. Update the values for your Blob container and save the file as backend.hcl.

## Usage

Initialize Terraform:

```sh
terraform init -backend-config=./environments/lab/backend.hcl
```

Review the planned changes:

```sh
terraform plan --var-file=./environments/lab/lab.tfvars
```

Apply the configuration:

```sh
terraform apply --var-file=./environments/lab/lab.tfvars
```

## Cleanup

To destroy all resources created by these Terraform files:

```sh
terraform destroy --var-file=./environments/lab/lab.tfvars
```

## Notes

- Put your environment specific values in the ./environments directory.
- Review and update the values in your tfvars file that you will use for your specific environment.
- Ensure your Azure user has suffience permissions.