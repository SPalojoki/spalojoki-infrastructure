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
    location   = var.gcp_location

    labels = {
        developer = each.value.developer
        environment = "development"
    }
}

resource "google_bigquery_dataset" "production_datasets" {
    for_each = { for d in local.prod_datasets : d.id => d }

    dataset_id = each.key
    project    = var.gcp_project
    location   = var.gcp_location

    labels = {
        environment = "production"
    }
}

# Shared (prod + dev) landing dataset
resource "google_bigquery_dataset" "landing_dataset" {
    dataset_id = "analytics__landing"
    project    = var.gcp_project
    location   = var.gcp_location

    labels = {
        environment = "shared"
    }
}