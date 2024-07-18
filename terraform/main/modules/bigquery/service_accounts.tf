# Service account for production DBT usage and data ingestion
resource "google_service_account" "analytics_prod__sa" {
  account_id   = "dbt-prod" # TODO: Rename to analytics-prod-sa. Causes creation of a new key.
  display_name = "DBT CI/CD Service Account"
}

resource "google_service_account_key" "analytics_prod__sa_key" {
  service_account_id = google_service_account.analytics_prod__sa.name
}

resource "google_project_iam_member" "analytics_prod__sa_iam_member__editor" {
  project = var.gcp_project
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.analytics_prod__sa.email}"
}

resource "google_project_iam_member" "analytics_prod__sa_iam_member__user" {
  project = var.gcp_project
  role    = "roles/bigquery.user"
  member  = "serviceAccount:${google_service_account.analytics_prod__sa.email}"
}