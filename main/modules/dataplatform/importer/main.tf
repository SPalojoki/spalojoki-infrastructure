resource "google_service_account" "github_action_importer_sa" {
  account_id   = "github-action-importer"
  display_name = "SA used by the dataplatform-importer GitHub Action"
}

resource "google_service_account_key" "github_action_importer_key" {
  service_account_id = google_service_account.github_action_importer_sa.name
}

output "github_action_importer_credentials" {
  value = google_service_account_key.github_action_importer_key.private_key
  sensitive = true
}

resource "google_project_iam_member" "cloudfunctions_developer_binding" {
  project = var.gcp_project
  role    = "roles/cloudfunctions.developer"
  member  = "serviceAccount:${google_service_account.github_action_importer_sa.email}"
}

resource "google_project_iam_member" "viewer_binding" {
  project = var.gcp_project
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.github_action_importer_sa.email}"
}

resource "google_project_iam_member" "storage_admin_binding" {
  project = var.gcp_project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.github_action_importer_sa.email}"
}

resource "google_project_iam_member" "service_account_user_binding" {
  project = var.gcp_project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github_action_importer_sa.email}"
}

resource "google_pubsub_topic" "importer_function_schedule_topic" {
  for_each = { for schedule in var.importer_schedules : schedule.name => schedule }

  name = "${each.value.name}-topic"
}

resource "google_cloud_scheduler_job" "importer_function_schedule" {
  for_each = { for func in var.importer_schedules : func.name => func }

  name        = "${each.value.name}-schedule"
  schedule    = each.value.schedule

  region = "europe-central2" # Variable override: investigate this, europe-north not available for some reason

  pubsub_target {
    topic_name = google_pubsub_topic.importer_function_schedule_topic[each.key].id
    data       = base64encode("{\"Scheduler job with name\":\"${each.value.name}\"}")
  }

  time_zone = "Europe/Helsinki"
}
