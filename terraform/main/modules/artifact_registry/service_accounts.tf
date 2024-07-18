resource "google_service_account" "github_action_artifact_sa" {
  account_id   = "github-action-artifact"
  display_name = "SA used by the repositories to push images to Artifact Registry"
}

resource "google_service_account_key" "github_action_artifact_key" {
  service_account_id = google_service_account.github_action_artifact_sa.name
}

resource "google_artifact_registry_repository_iam_binding" "artifact_registry_writer_binding" {
  location       = google_artifact_registry_repository.artifact_registry_repository.location
  repository     = google_artifact_registry_repository.artifact_registry_repository.repository_id
  role           = "roles/artifactregistry.writer"
  members        = [
    "serviceAccount:${google_service_account.github_action_artifact_sa.email}"
  ]
}

resource "google_service_account" "reader_artifact_sa" {
  account_id   = "reader-artifact"
  display_name = "SA used by the compute to pull images from Artifact Registry"
}

resource "google_service_account_key" "reader_artifact_key" {
  service_account_id = google_service_account.reader_artifact_sa.name
}

resource "google_artifact_registry_repository_iam_binding" "artifact_registry_reader_binding" {
  location       = google_artifact_registry_repository.artifact_registry_repository.location
  repository     = google_artifact_registry_repository.artifact_registry_repository.repository_id
  role           = "roles/artifactregistry.reader"
  members        = [
    "serviceAccount:${google_service_account.reader_artifact_sa.email}"
  ]
}