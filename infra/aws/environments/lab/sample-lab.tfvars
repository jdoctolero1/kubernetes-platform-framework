environment = "lab"
region = "us-east-1"
region_short = "ue1"
vpc_name = "vpc-lab-ue1"
subnet_admin_name = "subnet-admin-lab-01"
subnet_app_name = "subnet-app-lab-01"
subnet_web_name_01 = "subnet-web-lab-01"
subnet_web_name_02 = "subnet-web-lab-02"
key_name = "keypair-lab-adm-ue1-01"
kube_admin_username = "labadm"
vm_associate_public_ip_address = true
kube_authorized_keys = [
    "<put key here>"
]
kube_cp_private_ip = "10.1.1.1"
kube_wn_private_ips = ["10.1.2.1", "10.1.2.2"]
private_zone_name = "<Your Private DNS>"
certificate_domain_name = "<Your Cert Domain>"
public_zone_name = "<Your Publix DNS>"
kube_node_port = 30007
ec2_instance_type = "t3.small"

tags = {
    CostCenter = 1001
}