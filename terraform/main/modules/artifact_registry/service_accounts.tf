resource "google_service_account" "container_pusher__sa" {
  account_id   = "github-action-artifact"
  display_name = "SA used by the repositories to push images to Artifact Registry"
}

resource "google_service_account_key" "container_pusher__sa_key" {
  service_account_id = google_service_account.container_pusher__sa.name
}

resource "google_service_account" "container_puller__sa" {
  account_id   = "reader-artifact"
  display_name = "SA used by the compute to pull images from Artifact Registry"
}

resource "google_service_account_key" "container_puller__sa_key" {
  service_account_id = google_service_account.container_puller__sa.name
}