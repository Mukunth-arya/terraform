resource "google_compute_network" "mynet" {
  name                    = "main"
  project                 = "myterraformpro"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1500
}



resource "google_compute_subnetwork" "private" {
  name                     = "private"
  project                  = "myterraformpro"
  ip_cidr_range            = "192.168.18.0/24"
  region                   = "asia-south1"
  network                  = google_compute_network.mynet.name
  private_ip_google_access = true


  secondary_ip_range {
    range_name    = "pod-ip-range"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "services-ip-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}

