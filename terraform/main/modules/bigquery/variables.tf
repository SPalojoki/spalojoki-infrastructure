variable "analytics_developers" {
    description = "List of developers"
    type    = list(string)
    default = []
}

variable "gcp_project" {
    description = "GCP project id"
}

variable "gcp_location" {
    description = "GCP location"
    default = "EU"
}