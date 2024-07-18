# SPalojoki Infrastructure Terraform: main configuration

This Terraform project manages the infrastructure for the SPalojoki Data Platform, currently hosted on Google Cloud.

## Overview

### Providers

All resources are currently hosted on **Google Cloud**.

### Modules

The Terraform project includes the following modules:

- **BigQuery**: Manages the data warehouse for the SPalojoki Data Platform.
- **Artifact Registry**: Manages the storage and distribution of Docker images for various applications.
- **Google Cloud Compute**: Temporarily included and might be moved away from Google Cloud in the future.

For more details about the resources and their specific use-cases, please refer to the readme files located in the respective modules.

### Outputs

Various values, such as the Artifact Registry URL and service account keys, are defined in the `outputs.tf` file and can be retrieved as needed.
