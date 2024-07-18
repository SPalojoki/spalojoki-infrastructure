# SPalojoki Infrastructure Terraform: bootstrap configuration

This project is used to create the Terraform remote backend for the main SPalojoki Terraform project: it sets up a Google Cloud Storage bucket to store the Terraform state file and configures the necessary read and write permissions for the Terraform service account.

## Instructions

1. **Create the Terraform Service Account on Google Cloud Console.**

    - The Terraform service account should be created in the Google Cloud Console.
    - This service account will be used in both the bootstrap and main projects.

2. **Configure GCP Credentials** by saving your GCP Service Account Credentials JSON file in a secure location on your local environment and setting the path in an environment variable:

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS=/path/to/your/credentials.json
    ```

3. **Run the Terraform scripts** to create the Google Cloud Storage bucket and set up permissions:
   ```sh
   terraform init
   terraform apply
   ```

   *The service account doesn't most likely have the necessary permissions to create the bucket and bindings. Follow the instructions by the Terraform command line output.*

4. **Configure the service account and remote state to the [main project](https://github.com/SPalojoki/spalojoki-infrastructure/tree/main/terraform/main) and continue there.**

## Couple of remarks

   - This project should be run only once to initialize the infrastructure!
   - The Terraform state of the project is stored locally on the filesystem and should not be committed to git.