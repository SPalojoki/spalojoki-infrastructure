output "container_pusher_credentials" {
  value = google_service_account_key.container_pusher__sa_key.private_key
  sensitive = true
}

output "container_puller_credentials" {
  value = google_service_account_key.container_puller__sa_key.private_key
  sensitive = true
}