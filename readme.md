# SPalojoki Infrastructure

This repository contains the Terraform IaC configuration for the SPalojoki infrastructure on different cloud platforms.

## TL;DR Usage

```bash
cd main
terraform init
# Make changes
terraform plan
terraform apply
```

## Directory Structure

- `/bootstrap`: Contains files for initializing infrastructure used by Terraform. Most importantly, it includes files for creating the GCS bucket for storing the Terraform remote state. This directory should be used only when recreating the infrastructure from scratch.
- `/main`: Contains the Terraform files defining the SPalojoki infrastructure itself.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Google Cloud CLI](https://cloud.google.com/sdk/docs/install)

Additionally, you need GCP credentials with necessary permissions.

## Usage

1. **Install and Set Up Dependencies**

    Ensure the necessary dependencies are installed:

    - [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
    - [Google Cloud CLI](https://cloud.google.com/sdk/docs/install)

2. **Configure GCP Credentials**

    Save your GCP Service Account Credentials JSON file in a secure location on your local environment and set the path in an environment variable:

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS=/path/to/your/credentials.json
    ```

3. **Initialize and Apply Terraform Configuration**

    Navigate to the `main` directory, make wanted changes to the configuration and run the following Terraform commands:

    ```bash
    cd main
    terraform init # Only once
    terraform plan
    terraform apply
    ```

### Terraform Commands

- `terraform init`: Initializes the Terraform working directory by downloading the necessary provider plugins and modules.
- `terraform plan`: Creates an execution plan, showing the changes that will be made to the infrastructure.
- `terraform apply`: Applies the changes required to reach the desired state of the configuration.

## Additional Resources

For more detailed guides and documentation, refer to:

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Google Cloud Documentation](https://cloud.google.com/docs)
