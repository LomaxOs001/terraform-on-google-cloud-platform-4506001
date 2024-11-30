
resource "google_compute_network" "app" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" var.network_name {
  name          = "var.network_name"
  ip_cidr_range = var.network_ip_cidr_range
  region        = var.region
  network       = google_compute_network.app.id
  
}

data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = var.image_project
  family      = var.image_family
}

resource "google_compute_instance" var.app_name {
  name         = var.app_name
  machine_type = var.vm_instance_type

  
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
   subnetwork = var.network_namead
   access_config {
      # Leave empty for dynamic public IP
    }
  }  
  
  allow_stopping_for_update = true
}