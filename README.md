# Kubernetes Platform Framework

This project provides a framework for building, deploying, and managing a Kubernetes cluster on virtual machines. Included are Terraform files for the basic infrastructure build and Ansible playbooks to deploy a Kubernetes cluster with a control plane and worker nodes.

## Use Case
Please see the [Case Study](./CASESTUDY.md) for more information on the scenario this project covers.

## Requirements
- An existing Azure Virtual Network (VNet) and subnets
- An existing Azure Public DNS Zone
- An Azure Key Vault with an existing SSL certificate

## Cloud Providers
![Azure Resources Diagram](./docs/diagrams/azure-resources.png)

<sub>Note: The VNet and subnets are assumed to already exist and are not provisioned by this IaC project.</sub>

## CNIs Supported

This project supports multiple Container Network Interface (CNI) plugins:

- **Cilium** - [A modern, eBPF-based CNI that provides advanced networking, observability, and security capabilities](https://cilium.io/)
- **Calico** - [A widely-used CNI offering policy-based networking and high performance](https://www.tigera.io/project-calico/)

You can choose either CNI based on your specific requirements and use case.

## Operating System Support
This project supports **Ubuntu** as the operating system for both Kubernetes control plane and worker node virtual machines. Other operating systems are not currently supported.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
