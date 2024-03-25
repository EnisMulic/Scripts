# Azure DevOps Scripts

## Terraform to Variable Group (tf_to_var_group)

This script is meant to be used as a task in an Azure DevOps pipeline
that provisions infrastructure using Terraform to output sensitive
configuration values into a variable group to be later read by an
application as part of a CI/CD process, e.g:

```yaml
- task: Bash@3
  inputs:
    targetType: filePath
    arguments: $(System.TeamFoundationCollectionUri) $(System.TeamProjectId) prod-vars
    workingDirectory: $(WORKING_DIR)
    filePath: tf_to_var_group
  env:
    AZURE_DEVOPS_EXT_PAT: $(System.AccessToken)
```

```hcl
output "connectionString" {
  value       = module.application_insights.connection_string
  description = "Application insights connection string."
  sensitive   = true
}
```
