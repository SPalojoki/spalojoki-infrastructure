resource "google_compute_instance" "default" {
  name         = "testing-vm"
  machine_type = "e2-small"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    
    access_config {
    }
  }
}