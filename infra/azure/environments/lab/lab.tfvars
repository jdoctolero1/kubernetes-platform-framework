location = "centralus"
environment = "lab"
kcp_vm_ip = "10.4.1.1"

kwn_vm_ips = ["10.6.1.1", "10.6.1.2"]

admin_username     = "labadm"
admin_ssh_key_path = "./files/id_rsa.pub"

tags = {
  environment = "lab"
}

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