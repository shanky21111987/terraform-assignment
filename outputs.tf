output "vpc_id" {
value = google_compute_network.vpc.vpc_id
}
output "subnet_self_link" {
value = google_compute_subnetwork.subnet.subnet_self_link
}
