location = "centralus"
environment = "lab"
kcp_vm_ip = "10.191.229.5"

kwn_vm_ips = ["10.191.232.4"]

admin_username     = "labadm"
admin_ssh_key_path = "./files/id_rsa.pub"

tags = {
  environment = "lab"
}

cert_name                    = "lab-doctolero-org"
dns_zone_name                = "lab.doctolero.org"
dns_zone_resource_group_name = "rg-lab-dns-centralus"
dns_record_name              = "fe-kube"

kcp_vm_size             = "Standard_D2s_v3"
kcp_image_publisher     = "canonical"
kcp_image_offer         = "ubuntu-24_04-lts"
kcp_image_sku           = "server"
kcp_image_version       = "latest"

kwn_vm_size             = "Standard_D2s_v3"
kwn_image_publisher     = "canonical"
kwn_image_offer         = "ubuntu-24_04-lts"
kwn_image_sku           = "server"
kwn_image_version       = "latest"

key_vault_name          = "kvlabcentralus01"
agw_managedid_name      = "managedid-lab-appgw-centralus"
managedid_resource_group = "rg-lab-admin-centralus"