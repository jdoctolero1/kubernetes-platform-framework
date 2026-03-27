# Kubernetes Ansible Platform
This repository provides an Ansible framework for deploying a Kubernetes cluster. 

## Usage

**Customize Inventory:**

Create a custom environment in `./inventory` to define your target hosts and groups. The environment *lab* is provided with sample servers and group vars.

**Run Playbooks:**

Execute playbooks from the root `./ansible` directory. For example:

```sh
ansible-playbook ./playbooks/kube_platform.yml -i ./inventory/lab
```

## Directory Structure

- **./inventory/**  
    Inventory files defining the hosts and groups for your Kubernetes environment. Customize these files to match your infrastructure.

- **./playbooks/**  
    Ansible playbooks for building the Kubernetes control plane and worker nodes.

- **./roles/**  
    Reusable roles for the common Kubernetes components, control plane and worker node builds.