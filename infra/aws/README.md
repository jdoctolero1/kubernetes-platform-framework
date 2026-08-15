# AWS Platform Infrastructure

This directory contains Terraform (`.tf`) files to provision the foundational AWS infrastructure required for a Kubernetes cluster on EC2 instances. The resources created include:

- **Kubernetes Control Plane Node**: The control plane node for the Kubernetes cluster.
- **Kubernetes Worker Nodes**: Nodes that run your containerized workloads.
- **Application Load Balancer**: Layer 7 (application) load balancer that provides secure HTTPS connections to your Kubernetes cluster. 
- **Public Alias Record**: Public alias record for the Application Load Balancer.
- **Private A Records**: Private A records for the EC2 instances.
- **Control Plane Security Group**: Manages ingress and egress traffic for the Kubernetes control plane node, including API server (6443), etcd (2379-2380), kubelet (10250), and CNI plugin ports.
- **Worker Node Security Group**: Manages ingress and egress traffic for worker nodes, including kubelet (10250), NodePort services (30000-32767), and CNI plugin communication.
- **Application Load Balancer Security Group**: Controls inbound HTTP (80) and HTTPS (443) traffic from the internet and allows forwarding to worker node NodePorts.

## Prerequisites
- An AWS S3 bucket for usage as a Terraform backend.
- An existing SSH key pair for connection to the EC2 instances. Populate the `kube_authorized_keys` variable with your SSH public key.

## Required Components
- The VPC and Subnets that the EC2 instances and Application Load Balancer will reside in are already provisioned.
- Route 53 Public zone to save an alias record for the Application Load Balancer.
- Route 53 Private zone to save A records for the EC2 instance's private IP addresses.
- An existing SSL certificate in AWS Certificate Manager to be used by the Application Load Balancer.

## Terraform Workspaces
It is highly encouraged to use a Terraform workspace to manage your environments.

For more information on Terraform workspaces, see the [official documentation](https://developer.hashicorp.com/terraform/language/state/workspaces).

## Sample .tfvars and backend.hcl files
Use the sample tfvars file under ./environments/sample-lab.tfvars. Update the values for your AWS environment and save the file as lab.tfvars.

Use the sample-backend.hcl file for saving your Terraform state file to S3. Update the values for your Blob container and save the file as backend.hcl.

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
- Ensure your AWS IAM user has suffience permissions.