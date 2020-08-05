# Terraform Module AWS Backup

Module to manage AWS Backup with Terraform.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enabled | Whether or not to enable this entire module or not. | string | `"true"` | no |
| plan\_create | Whether or not to create a plan. | string | `"true"` | no |
| plan\_name | Name of the plan. | string | `"backup-plan"` | no |
| plan\_rule\_completion\_window | The amount of time AWS Backup attempts a backup before canceling the job and returning an error for the plan. | string | `""` | no |
| plan\_rule\_lifecycle\_cold\_storage\_after | Specifies the number of days after creation that a recovery point is moved to cold storage. | string | `""` | no |
| plan\_rule\_lifecycle\_delete\_after | Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after. | string | `""` | no |
| plan\_rule\_name | Name of the rule for the plan. | string | `"backup-rule"` | no |
| plan\_rule\_recovery\_point\_tags | Metadata that you can assign to help organize the resources that you create for the plan. | map | `{}` | no |
| plan\_rule\_schedule | A CRON expression specifying when to initiates a backup job for the plan. | string | `""` | no |
| plan\_rule\_start\_window | The amount of time in minutes before beginning a backup for the plan. | string | `""` | no |
| plan\_tags | Tags for the Backup plan. Will be merged with tags. | map | `{}` | no |
| selection\_by\_tags | Whether or not to create a selection by tags. | string | `"false"` | no |
| selection\_create | Whether or not to create a selection. | string | `"true"` | no |
| selection\_iam\_role\_name | Name of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource. | string | `"BackupRole"` | no |
| selection\_plan\_id | The backup plan ID to be associated with the selection of resources. Must be specified if plan_create is false. | string | `""` | no |
| selection\_role\_arn | ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource. Must be specified if selection_role_create is false. | string | `""` | no |
| selection\_role\_create | Whether or not to create a role for selection. | string | `"true"` | no |
| selection\_tag\_key | The key in a key-value pair of the selection by tags. | string | `"Backup"` | no |
| selection\_tag\_name | Name of the selection by tags. | string | `"selection-by-tag"` | no |
| selection\_tag\_type | An operation, such as 'StringEquals', that is applied to a key-value pair used to filter resources in a selection. | string | `"STRINGEQUALS"` | no |
| selection\_tag\_value | The value in a key-value pair of the selection by tags. | string | `"1"` | no |
| tags | Tags to be shared among all resources of this module. | map | `{}` | no |
| vault\_create | Whether or not to create a vault for AWS Backup. | string | `"true"` | no |
| vault\_kms\_key\_alias\_name | Alias for the KMS key of the Backup vault. Will be merged with tags. | string | `""` | no |
| vault\_kms\_key\_arn | ARN of the KMS key to use for the vault for AWS Backup. Do not specify if you want to let the module create it own key. | string | `"null"` | no |
| vault\_kms\_key\_create | Whether or not to create a KMS key for the vault for AWS Backup. | string | `"true"` | no |
| vault\_kms\_key\_name | Name of the KMS key to use for the vault for AWS Backup. | string | `""` | no |
| vault\_kms\_tags | Tags for the KMS key of the Backup vault. Will be merged with tags. | map | `{}` | no |
| vault\_name | Name of the backup vault to use. | string | `"default"` | no |
| vault\_tags | Tags for the Backup vault. Will be merged with tags. | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| plan\_arns | ARNs of the backup plans. |
| plan\_iam\_role\_arn | ARN of the role for the backup plans. |
| plan\_iam\_role\_name | Name of the role for the backup plans. |
| plan\_iam\_role\_unique\_id | Stable and unique string identifying the role for the backup plans. |
| plan\_versions | Unique, randomly generated, Unicode, UTF-8 encoded strings that serves as the version ID of the backup plans. |
| selection\_tag\_ids | Backup Selection identifiers (by tags). |
| vault\_arn | ARN of the vault. |
| vault\_id | The name of the vault. |
| vault\_kms\_key\_alias\_arn | ARN of the KMS key alias for the backup vault. |
| vault\_kms\_key\_arn | ARN of the KMS key for the backup vault. |
| vault\_kms\_key\_id | Globally unique identifier of the KMS key for the backup vault. |
| vault\_recovery\_points | The number of recovery points that are stored in a backup vault. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
