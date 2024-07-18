# BigQuery on SPalojoki Infrastructure

Google Cloud BigQuery serves as the data warehouse for the SPalojoki Data Platform.

## Datasets

Datasets are organized based on two criteria:

1. **Environment**: This includes both production and individual developer datasets.
2. **Data Refinement Level**: For more details, refer to the [SPalojoki Dataplatform DBT repository](https://github.com/SPalojoki/spalojoki-dataplatform-dbt) and the medallion architecture.

There is also a shared landing dataset used across all environments for raw data ingestion.

### Naming Convention

Datasets follow this naming pattern:

```
{developer initials}__analytics__{refinement level}
```

Datasets without developer initials are designated as production datasets.

Developer initials are defined in the `analytics_developers` Terraform variable.

## Service Accounts

Currently, there is a single service account `analytics_prod__sa` with both read and write permissions for accessing BigQuery from external production applications like DBT and Airflow. Permissions are granted at the project level, but transitioning to dataset-level permissions should be considered if additional datasets are created for various purposes.

The BigQuery production service account key can be accessed via the `analytics_prod_credentials` output.