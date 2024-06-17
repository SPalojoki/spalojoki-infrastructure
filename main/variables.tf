variable "gcp_project" {
    description = "GCP project id"
}

variable "gcp_region" {
    description = "GCP region"
    default = "europe-north1"
}

variable "gcp_zone" {
    description = "GCP zone within the selected region"
    default = "europe-north1a"
}

variable "gcp_location" {
    description = "GCP location"
    default = "EU"
}

variable "spalojoki_infra_bucket" {
    description = "Name of the GCP bucket used to store infra related files, for instance remote Terraform state"
    default = "spalojoki-infrastructure-bucket"
}

variable "tf_state_bucket_path" {
    description = "File path the TF remote state is saved to in the GCS bucket"
    default = "terraform/state"
}

variable "analytics_developers" {
    description = "List of developers"
    type    = list(string)
    default = []
}

variable "importer_schedules" {
  description = "A list of schedules to create for the importer functions."
  type = list(object({
    name        = string
    schedule    = string
  }))
  default = []
}