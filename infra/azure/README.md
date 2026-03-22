# Azure Kubernetes Platform Infrastructure

This directory contains Terraform (`.tf`) files to provision the foundational Azure infrastructure required for a Kubernetes cluster. The resources created include:

- **Resource Group**: The resource group to contain the Kubernetes resources.
- **Network Security Groups (NSGs)**: Define and allow network communication between cluster components.
- **Kubernetes Control Plane Node**: The master node managing the Kubernetes cluster.
- **Kubernetes Worker Nodes**: Nodes that run your containerized workloads.

## Prerequisites
- An Azure Blob container for usage as a Terraform backend.
- Create a backend.hcl file for your environment. You can use the sample-backend.hcl file provided under ./environments/lab/sample-backend.hcl.
- Create an id_rsa.pub file for your ssh key in the ./files directory. This will allow you to ssh into your VMs.
- The VNet and Subnets that the VMs and NSGs will reside in are already provisioned and will follow the naming convention.

## Terraform Workspaces
It is highly encouraged to use a Terraform workspace to manage your environments.

For more information on Terraform workspaces, see the [official documentation](https://developer.hashicorp.com/terraform/language/state/workspaces).

## Usage

1. Initialize Terraform:

    ```sh
    terraform init -backend-config=./environments/lab/backend.hcl
    ```

2. Review the planned changes:

    ```sh
    terraform plan --var-file=./environments/lab/lab.tfvars
    ```

3. Apply the configuration:

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
- Ensure your Azure subscription has sufficient quota for the requested resources.
