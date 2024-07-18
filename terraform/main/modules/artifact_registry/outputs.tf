output "github_action_artifact_credentials" {
  value = google_service_account_key.github_action_artifact_key.private_key
  sensitive = true
}

output "reader_artifact_credentials" {
  value = google_service_account_key.reader_artifact_key.private_key
  sensitive = true
}