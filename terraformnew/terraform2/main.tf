provider "google" {
  credentials = file("myfile.json")
  version     = "3.65"
  project     = "kuberpro-336213"
  region      = "us-central1"
  zone        = "us-central1-c"
}
resource "google_compute_instance" "appserver" {
  name                      = "terraform-sample"
  machine_type              = "f1-micro"
  zone                      = "us-central1-c"
  allow_stopping_for_update = true
  labels = {
    name  = "mynetwork1",
    owner = "mukunth"
    user  = "mukunth"
    dept  = "it"
    os    = "centos"
  }
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}








