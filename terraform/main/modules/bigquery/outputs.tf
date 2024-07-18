output "analytics_prod_credentials" {
  value = google_service_account_key.analytics_prod__sa_key.private_key
  sensitive = true
}