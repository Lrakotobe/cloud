provider "google" {
  project = "cle-api-map-353221"
  region  = "europe-west1"
}

resource "google_container_cluster" "my_cluster" {
  name               = "my-cluster"
  location           = "europe-west1-b"
  initial_node_count = 3
  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 20
  }
}