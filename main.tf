resource "google_compute_instance" "web" {
name = var.instance_name
machine_type = var.machine_type
zone = var.zone
boot_disk { 
initialize_params {
image = var.image
size = 20
type = "pd-balanced"
}
}
network_interface { 
subnetwork = var.subnet_self_link
}
tags = ["web-server"]
metadata_startup_script = file("${path.module}/startup-script.sh")
}
