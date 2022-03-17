output "internal_IP" {
  value = google_compute_instance.appserver.network_interface.0.network_ip
}
output "External_IP" {
  value = google_compute_instance.appserver.network_interface.0.access_config.0.nat_ip
}
