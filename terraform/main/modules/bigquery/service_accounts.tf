# Service account for production DBT usage (CI/CD, etc.)
resource "google_service_account" "dbt_prod_service_account" {
  account_id   = "dbt-prod"
  display_name = "DBT CI/CD Service Account"
}

resource "google_service_account_key" "dbt_prod_sa_key" {
  service_account_id = google_service_account.dbt_prod_service_account.name
}

resource "google_project_iam_member" "dbt_prod_bq_dataeditor_binding" {
  project = var.gcp_project
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.dbt_prod_service_account.email}"
}

resource "google_project_iam_member" "dbt_prod_bq_user_binding" {
  project = var.gcp_project
  role    = "roles/bigquery.user"
  member  = "serviceAccount:${google_service_account.dbt_prod_service_account.email}"
}