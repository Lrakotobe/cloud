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
  metadata {
    name             = "monapp"
  }
  spec {
    selector {
      match_labels = {
        "app" = "monapp"
      }
    }
    replicas = 2
    template {
      metadata {
        labels = {
          "app" = "monapp"
        }
      }
      spec {
        container {
          name = "monapp"
          image = "my-registry.com/monapp:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}