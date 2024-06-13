provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "google_storage_bucket" "infrastructure_bucket" {
  name     = var.spalojoki_infra_bucket
  location = "EU"
  force_destroy = true
}