resource "google_compute_firewall" "allow-ssh" {
name = "${var.name_prefix}-allow-ssh"
network = var.network
allow {
protocol = "tcp"
ports = ["22"]
}
source_ranges = var.ssh_source_ranges
}
resource "google_compute_firewall" "allow-http-https" {
name = "${var.name_prefix}-allow-http-https"
network = var.network
allow { 
protocol = "tcp"
ports = ["80", "443"]
}
source_ranges = ["0.0.0.0/0"]
}
