location = "centralus"
environment = "lab"

#IP Addresses for the controlplane and worker node VMs.
kcp_vm_ip = "10.1.1.1"
kwn_vm_ips = ["10.1.2.1", "10.1.2.2"]

#Local Admin User on Ubuntu host and it's respective ssh key
admin_username     = "kubeadmin"
admin_ssh_key_path = "./files/id_rsa.pub"

#DNS and SSL Configurations
cert_name                    = "mykuberneteslab-org"
dns_zone_name                = "mykuberneteslab.org"
dns_zone_resource_group_name = "rg-lab-dns-centralus"
dns_record_name              = "fe-kube"

#Control Plane VM Settings
kcp_vm_size             = "Standard_D2s_v3"
kcp_image_publisher     = "canonical"
kcp_image_offer         = "ubuntu-24_04-lts"
kcp_image_sku           = "server"
kcp_image_version       = "latest"

#Worker Node VM Settings
kwn_vm_size             = "Standard_D2s_v3"
kwn_image_publisher     = "canonical"
kwn_image_offer         = "ubuntu-24_04-lts"
kwn_image_sku           = "server"
kwn_image_version       = "latest"

#Key Vault Settings
key_vault_name          = "mykeyvault01"
agw_managedid_name      = "managedid-lab-appgw-centralus"
managedid_resource_group = "rg-lab-security-centralus"

tags = {
  environment = "lab"
}