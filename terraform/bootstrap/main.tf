provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "google_storage_bucket" "infrastructure_bucket" {
  name          = var.spalojoki_infra_bucket
  location      = "EU"
  force_destroy = false

  public_access_prevention = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}

resource "google_storage_bucket_iam_member" "terraform_state_writer" {
  bucket   = google_storage_bucket.infrastructure_bucket.name
  role     = "roles/storage.objectAdmin"
  member   = "serviceAccount:${var.terraform_service_account_email}"
}

resource "google_storage_bucket_iam_member" "terraform_state_reader" {
  bucket   = google_storage_bucket.infrastructure_bucket.name
  role     = "roles/storage.objectViewer"
  member   = "serviceAccount:${var.terraform_service_account_email}"
}

output "bucket_name" {
  value = google_storage_bucket.infrastructure_bucket.name
}
