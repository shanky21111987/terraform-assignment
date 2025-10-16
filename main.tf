terraform {
required_providers {
google = {
source = "hashicorp/google"
version = "~>6.0"
}
}
}
module "virtual network"{
source = "/modules/virtual network"
network_name = "proj-dev-vpc"
subnet_name = "proj-dev-subnet"
subnet_cidr = "10.10.0.0/24"
region = "us-central1"
}
module " network security group" {
source = "/modules/network security group"
name_prefix = "proj-dev"
network_self_link = module.virtual network.network_self_link
allowed_tcp_ports = ["22", "80"]
source_ranges = ["0.0.0.0/0"]
target_tags = ["web-server"]
}
module "virtual machine" {
source = "/modules/virtual machine"
project = var.project_id
zone = var.zone
instance_name = "web-01"
machine_type = "e2-micro"
image = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v202"
network_self_link = module.virtual network.network_self_link
}
