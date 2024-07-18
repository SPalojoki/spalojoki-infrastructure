output "container_pusher_credentials" {
  value = google_service_account_key.container_pusher__sa_key.private_key
  sensitive = true
}

output "container_puller_credentials" {
  value = google_service_account_key.container_puller__sa_key.private_key
  sensitive = true
}

output "artifact_registry_url" {
  value = "${google_artifact_registry_repository.artifact_registry_repo.location}-docker.pkg.dev/${var.gcp_project}/${google_artifact_registry_repository.artifact_registry_repo.repository_id}"
}