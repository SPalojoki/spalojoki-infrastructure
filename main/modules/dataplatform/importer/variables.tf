variable "gcp_location" {
    description = "GCP location"
    default = "EU"
}

variable "importer_schedules" {
  description = "A list of schedules to create for the importer functions."
  type = list(object({
    name        = string
    schedule    = string
  }))
  default = []
}

variable "gcp_region" {
    description = "GCP region"
    default = "europe-north1"
}

variable "gcp_project" {
    description = "GCP project id"
}