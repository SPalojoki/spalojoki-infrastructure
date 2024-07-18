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

variable "analytics_developers" {
    description = "List of developers"
    type    = list(string)
    default = []
}