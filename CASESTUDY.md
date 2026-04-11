# Kubernetes Platform on Virtual Machines

## The Company
DevOps Unlimited (DOU) is a Cloud and Platform Engineering consulting company that provides engineering transformation services to it's clients.

##  The Problem
A current client's datacenter contract was expiring, and we didn’t have the luxury of a two-year modernization program. The business needed cloud scalability and resilience fast. However, redesigning our entire Kubernetes platform to be cloud native under that deadline would have multiplied risk. 

## The Solution
The decision was made to migrate the Kubernetes cluster to cloud-hosted virtual machines. The cloud native services Application Gateway, Key Vault, and Public DNS will be provisioned to simplify ingress management, certificate handling, and external name resolution.