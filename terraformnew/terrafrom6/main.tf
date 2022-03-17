provider "google" {
  project = "myterraformpro"
  credentials = file(myfile.json)
  region = asia-south1
  zone = asia-south1-c
}

resource "google_container_cluster" "mycluster" {
  name     = "my-gke-cluster"
  location = "us-central1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster_mycluster
  node_count = 3

  node_config {
    
    machine_type = "e2-medium"
}
