locals {
    dataset_suffixes = ["__stg", "__ref", "__int",""]
    dev_datasets = flatten([
        for developer in var.analytics_developers : [
        for suffix in local.dataset_suffixes : {
            id = "${developer}__analytics${suffix}"
            developer = developer
            suffix = suffix
        }
        ]
    ])
    prod_datasets = flatten([
        for suffix in local.dataset_suffixes : {
            id = "analytics${suffix}"
        }
    ])
}


# Loops over the local variables above to create individual developer datasets as well as production datasets.
resource "google_bigquery_dataset" "developer_datasets" {
    for_each = { for d in local.dev_datasets : d.id => d }

    dataset_id = each.key
    project    = var.gcp_project
    location   = "EU"

    labels = {
        developer = each.value.developer
        environment = "development"
    }
}

resource "google_bigquery_dataset" "production_datasets" {
    for_each = { for d in local.prod_datasets : d.id => d }

    dataset_id = each.key
    project    = var.gcp_project
    location   = "EU"

    labels = {
        environment = "production"
    }
}

# Shared (prod + dev) landing dataset
resource "google_bigquery_dataset" "landing_dataset" {
    dataset_id = "analytics__landing"
    project    = var.gcp_project
    location   = "EU"

    labels = {
        environment = "shared"
    }
}

# Service account for production DBT usage (CI/CD, etc.)
resource "google_service_account" "dbt_prod_service_account" {
  account_id   = "dbt-prod"
  display_name = "DBT CI/CD Service Account"
}

resource "google_service_account_key" "dbt_prod_sa_key" {
  service_account_id = google_service_account.dbt_prod_service_account.name
}

output "dbt_prod_credentials" {
  value = google_service_account_key.dbt_prod_sa_key.private_key
  sensitive = true
}

# Service account for local DBT usage
resource "google_service_account" "dbt_dev_service_account" {
  account_id   = "dbt-dev"
  display_name = "DBT Dev Service Account"
}

resource "google_bigquery_dataset_iam_member" "dbt_prod_iam_binding" {
  for_each = { for d in local.prod_datasets : d.id => d }

  dataset_id = each.key
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.dbt_prod_service_account.email}"
}

resource "google_bigquery_dataset_iam_member" "dbt_dev_iam_binding" {
  for_each = { for d in local.dev_datasets : d.id => d }

  dataset_id = each.key
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.dbt_dev_service_account.email}"
}