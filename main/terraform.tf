terraform {
  backend "gcs" {
    bucket = var.spalojoki_infra_bucket
    prefix = var.tf_state_bucket_path
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}