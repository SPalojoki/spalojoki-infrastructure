output "artifact_registry_url" {
  value = module.artifact_registry.artifact_registry_url
}

output "container_pusher_credentials" {
  value = module.artifact_registry.container_pusher_credentials
  sensitive = true
}

output "container_puller_credentials" {
  value = module.artifact_registry.container_puller_credentials
  sensitive = true
}

output "analytics_prod_credentials" {
  value = module.bigquery.analytics_prod_credentials
  sensitive = true
}
