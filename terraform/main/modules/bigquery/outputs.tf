output "dbt_prod_credentials" {
  value = google_service_account_key.dbt_prod_sa_key.private_key
  sensitive = true
}