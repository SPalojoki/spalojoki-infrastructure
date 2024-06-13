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
    description = "Name of the GCP bucket used to store infra related files, for instance remote Terraform state"
    default = "spalojoki-infrastructure-bucket"
}

variable var.tf_state_bucket_path {
    description = "File path the TF remote state is saved to in the GCS bucket"
    default = "terraform/state"
}