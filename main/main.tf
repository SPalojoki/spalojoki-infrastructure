terraform {
  backend "gcs" {
    bucket = "spalojoki-infrastructure-bucket"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "wise-key-423412-q8"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}