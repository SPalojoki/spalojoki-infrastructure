output "github_action_importer_credentials" {
  value = module.importer.github_action_importer_credentials
  sensitive = true
}

output "github_action_artifact_credentials" {
  value = module.artifact_registry.github_action_artifact_credentials
  sensitive = true
}