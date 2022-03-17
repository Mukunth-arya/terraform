resource "google_compute_router" "router" {
  name    = "router"
  region  = "asia-south1"
  project = "myterraformpro"
  network = google_compute_network.mynet.name
}
