resource "google_compute_instance" "spalojoki-vm" {
  name         = "spalojoki-vm"
  machine_type = "e2-standard-2"
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