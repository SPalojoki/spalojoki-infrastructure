provider "google" {
  project = "wise-key-423412-q8"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

resource "google_storage_bucket" "spalojoki_infrastructure_bucket" {
  name     = "spalojoki-infrastructure-bucket"
  location = "EU"
  force_destroy = true
}