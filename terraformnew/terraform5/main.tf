provider "google" {
  project = "myterraformpro"
  credentials = file("myfile.json")
  region = "asia-south1"
  zone = "asia-south-1c"

}

resource "google_compute_instance_template" "tpl" {
  name         = "template"
  machine_type = "e2-medium"

  disk {
    source_image = "debian-cloud/debian-9"
    auto_delete  = true
    disk_size_gb = 100
    boot         = true
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  can_ip_forward = true
}

resource "google_compute_instance_from_machine_image" "tpl" {
  provider = google-beta
  name     = "instance-from-machine-image"
  zone     = "us-central1-a"

  source_machine_image = "mytemplate"

  // Override fields from machine image
  can_ip_forward = false
  labels = {
    my_key = "my1"
  }
}
