variable "gcp_project" {
    description = "GCP project id"
}

variable gcp_region {
    description = "GCP region"
    default = "europe-north1"
}

variable gcp_zone {
    description = "GCP zone within the selected region"
    default = "europe-north1a"
}

variable spalojoki_infra_bucket {
    description = "Name of the GCP bucket used to store remote Terraform state"
    default = "spalojoki-infrastructure-bucket"
}