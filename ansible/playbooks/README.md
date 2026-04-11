
# Playbooks

This directory contains Ansible playbooks for deploying and managing a Kubernetes platform.

## Main Playbooks

### kube_platform.yml
The primary playbook for building out a complete Kubernetes cluster. This playbook handles the automated provisioning, configuration, and initialization of all cluster components.

### healthcheck_app.yml
An optional playbook that deploys a simple health check application. It provisions an NGINX container with a basic status webpage for monitoring cluster health and availability.