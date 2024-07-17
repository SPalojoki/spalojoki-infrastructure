output "github_action_artifact_credentials" {
  value = module.artifact_registry.github_action_artifact_credentials
  sensitive = true
}

output "reader_artifact_credentials" {
  value = module.artifact_registry.reader_artifact_credentials
  sensitive = true
}

output "dbt_prod_credentials" {
  value = module.bigquery.dbt_prod_credentials
  sensitive = true
}