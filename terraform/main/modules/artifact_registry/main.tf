resource "google_artifact_registry_repository" "artifact_registry_repository" {
  location = "europe-west1" # For some reason, cannot be created to the same location as the project variable (europe-north1)
  repository_id = "spalojoki-artifact-registry"
  format = "DOCKER"
}