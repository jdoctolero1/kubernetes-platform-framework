# Azure Terraform Modules

This directory contains reusable Terraform modules for deploying the Azure resources to build the Kubernetes framework.

## Modules

### 1. Resource Group (`rg`)
Manages Azure Resource Group that contains the Kubernetes VMs, NICs, ect

**Usage:**
```hcl
module "rg" {
    source   = "./rg"
    name     = "example-rg"
    location = "East US"
}
```

### 2. Network Security Group (`nsg`)
Creates and manages Azure Network Security Groups to allow network communication between the Kubernetes control plane and worker nodes.

**Usage:**
```hcl
module "nsg" {
    source              = "./nsg"
    name                = "example-nsg"
    resource_group_name = module.rg.name
    location            = module.rg.location
    security_rules      = []
}
```

### 3. Virtual Machine (`vm`)
Deploys Azure Virtual Machines which will host Kubernetes

**Usage:**
```hcl
module "vm" {
    source              = "./vm"
    name                = "example-vm"
    resource_group_name = module.rg.name
    location            = module.rg.location
    nsg_id              = module.nsg.id
    # Add other required variables
}
```

## Requirements

- [Terraform](https://www.terraform.io/)
- [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

## Notes

- Customize variables as needed for your environment.
- Ensure you have appropriate Azure credentials configured.
