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
variable "infra_bucket_name" {
    description = "Name of the GCP bucket used to store remote Terraform state"
    default = "spalojoki-infrastructure-bucket"
}

variable "terraform_service_account_email" {
  description = "The email of the service account to be granted access to the bucket"
  type        = string
}