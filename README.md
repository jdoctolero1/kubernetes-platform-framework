# Kubernetes Platform Framework

This project provides a framework for building, deploying, and managing a Kubernetes cluster on virtual machines. Included are Terraform files for the basic infrastructure build and Ansible playbooks to deploy a Kubernetes cluster with a control plane and worker nodes.

## Use Case
Please see the [Case Study](./CASESTUDY.md) for more information on the scenario this project covers.

## Cloud Providers
![Azure Resources Diagram](./docs/diagrams/azure-resources.png)

<sub>Note: The VNet and subnets are assumed to already exist and are not provisioned by this IaC project.</sub>

## Operating System Support
This project supports **Ubuntu** as the operating system for both Kubernetes control plane and worker node virtual machines. Other operating systems are not currently supported.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
