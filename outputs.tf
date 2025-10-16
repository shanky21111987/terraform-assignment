output "firewall_rules" {
   value = [google_compute_firewall.allow-ssh.name,google_compute_firewall.allow-http-https.name]
}
