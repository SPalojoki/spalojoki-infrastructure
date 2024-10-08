terraform {
  backend "gcs" {
    # Variables not allowed here...
    bucket = "spalojoki-infra-bucket" 
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "bigquery" {
  source = "./modules/bigquery"

  gcp_project = var.gcp_project
  gcp_location = var.gcp_location
  analytics_developers = var.analytics_developers
}

module "artifact_registry" {
  source = "./modules/artifact_registry"

  gcp_project = var.gcp_project
}