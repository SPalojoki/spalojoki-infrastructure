resource "google_artifact_registry_repository" "artifact_registry_repo" {
  location = "europe-west1" # For some reason, cannot be created to the same location as the project variable (europe-north1)
  repository_id = "spalojoki-artifact-registry"
  format = "DOCKER"
}

resource "google_artifact_registry_repository_iam_binding" "artifact_registry_repo__iam_bindings__reader" {
  location       = google_artifact_registry_repository.artifact_registry_repo.location
  repository     = google_artifact_registry_repository.artifact_registry_repo.repository_id
  role           = "roles/artifactregistry.reader"
  members        = [
    "serviceAccount:${google_service_account.container_puller__sa.email}"
  ]
}

resource "google_artifact_registry_repository_iam_binding" "artifact_registry_repo__iam_bindings__writer" {
  location       = google_artifact_registry_repository.artifact_registry_repo.location
  repository     = google_artifact_registry_repository.artifact_registry_repo.repository_id
  role           = "roles/artifactregistry.writer"
  members        = [
    "serviceAccount:${google_service_account.container_pusher__sa.email}"
  ]
}