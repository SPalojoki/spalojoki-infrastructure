terraform {
  backend "gcs" {
    # Variables not allowed here...
    bucket = "spalojoki-infrastructure-bucket" 
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}