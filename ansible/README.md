# Kubernetes Ansible Platform
This repository provides an Ansible framework for deploying a Kubernetes cluster. 

## Usage

**Customize Inventory:**

Create a custom environment in `./inventory` to define your target hosts and groups. The environment *lab* is provided with sample servers and group vars.

**Run Playbooks:**

Run the kube_platform.yml playbook from the root `./ansible` directory to build the Kubernetes cluster components. For example:

```sh
ansible-playbook ./playbooks/kube_platform.yml -i ./inventory/lab
```

**(Optional) Create a health check deployment**

The included healthcheck_app.yml file will deploy an NGINX pod with a default page that returns `{"status": "ok"}` and a NodePort service that listens on port 30007. 

```sh
ansible-playbook ./playbooks/healthcheck_app.yml -i ./inventory/lab
```

## CNI Selection
The Ansible group var **cni_provider** controls which CNI is installed. You have a choice between the values `calico` or `cilium`. This group var should be specified in the kubernetes_admin.yml group vars.

```sh
cni_provider: "cilium" #values can be calico or cilium
```

## Directory Structure

- **./inventory/**  
    Inventory files defining the hosts and groups for your Kubernetes environment. Customize these files to match your infrastructure.

- **./playbooks/**  
    Ansible playbooks for building the Kubernetes control plane and worker nodes.

- **./roles/**  
    Reusable roles for the common Kubernetes components, control plane and worker node builds.