resource "google_artifact_registry_repository" "artifact_registry_repository" {
  location = "europe-west1"
  repository_id = "spalojoki-artifact-registry"
  format = "DOCKER"
}

resource "google_service_account" "github_action_artifact_sa" {
  account_id   = "github-action-artifact"
  display_name = "SA used by the repositories to push images to Artifact Registry"
}

resource "google_service_account_key" "github_action_artifact_key" {
  service_account_id = google_service_account.github_action_artifact_sa.name
}

output "github_action_artifact_credentials" {
  value = google_service_account_key.github_action_artifact_key.private_key
  sensitive = true
}

resource "google_artifact_registry_repository_iam_binding" "artifact_registry_writer_binding" {
  location       = google_artifact_registry_repository.artifact_registry_repository.location
  repository     = google_artifact_registry_repository.artifact_registry_repository.repository_id
  role           = "roles/artifactregistry.writer"
  members        = [
    "serviceAccount:${google_service_account.github_action_artifact_sa.email}"
  ]
}