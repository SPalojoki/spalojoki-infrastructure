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
  source = "./modules/dataplatform/bigquery"

  gcp_project = var.gcp_project
  analytics_developers = var.analytics_developers
}

module "importer" {
  source = "./modules/dataplatform/importer"

  gcp_location = var.gcp_location
  gcp_region = var.gcp_region
  importer_schedules = var.importer_schedules
  gcp_project = var.gcp_project
}
