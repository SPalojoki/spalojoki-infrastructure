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

module "bigquery" {
  source = "./modules/bigquery"

  gcp_project = var.gcp_project
  analytics_developers = var.analytics_developers
}

module "gcloud_compute" {
  source = "./modules/compute"
}

module "artifact_registry" {
  source = "./modules/artifact_registry"
}