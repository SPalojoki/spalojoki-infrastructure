# Artifact Registry on SPalojoki Infrastructure

Google Cloud Artifact Registry is used for storing and distributing Docker images of various applications within the SPalojoki infrastructure.

## Artifact Registry URL

The URL for the Artifact Registry follows this convention:

```
{artifact_registry_region}-docker.pkg.dev/${gcp_project_id}/{artifact_registry_repo}/{docker_image_name}
```

The URL can be retrieved using the `artifact_registry_url` output.

## Service Accounts

Two service accounts are utilized for interacting with the Artifact Registry:

- **container_pusher__sa**: This service account has write permissions to the registry and is used to push Docker images to the repository, typically by CI/CD pipelines.
- **container_puller__sa**: This service account has read permissions to the registry and is used by application hosts to fetch new images.

Permissions are configured at the repository level for these service accounts.

The service account keys can be accessed via the following outputs:

- `container_pusher_credentials`
- `container_puller_credentials`