####
# Vault
####

output "vault_id" {
  description = "The name of the vault."
  value       = element(concat(aws_backup_vault.maf_vault.*.id, [""]), 0)
}

output "vault_arn" {
  description = "ARN of the vault."
  value       = element(concat(aws_backup_vault.maf_vault.*.arn, [""]), 0)
}

output "vault_recovery_points" {
  description = "The number of recovery points that are stored in a backup vault."
  value       = element(concat(aws_backup_vault.maf_vault.*.recovery_points, [""]), 0)
}

output "vault_kms_key_arn" {
  description = "ARN of the KMS key for the backup vault."
  value       = element(concat(aws_kms_key.maf_vault_key.*.arn, [""]), 0)
}

output "vault_kms_key_id" {
  description = "Globally unique identifier of the KMS key for the backup vault."
  value       = element(concat(aws_kms_key.maf_vault_key.*.key_id, [""]), 0)
}

output "vault_kms_key_alias_arn" {
  description = "ARN of the KMS key alias for the backup vault."
  value       = element(concat(aws_kms_alias.maf_vault_key_alias.*.arn, [""]), 0)
}

####
# Plan
####

output "plan_arns" {
  description = "ARNs of the backup plans."
  value       = compact(concat(aws_backup_plan.maf_aws_backup_plan.*.arn, [""]))
}

output "plan_versions" {
  description = "Unique, randomly generated, Unicode, UTF-8 encoded strings that serves as the version ID of the backup plans."
  value       = compact(concat(aws_backup_plan.maf_aws_backup_plan.*.version, [""]))
}

output "plan_iam_role_arn" {
  description = "ARN of the role for the backup plans."
  value       = element(concat(aws_iam_role.maf_aws_backup_role.*.arn, [""]), 0)
}

output "plan_iam_role_name" {
  description = "Name of the role for the backup plans."
  value       = element(concat(aws_iam_role.maf_aws_backup_role.*.name, [""]), 0)
}

output "plan_iam_role_unique_id" {
  description = "Stable and unique string identifying the role for the backup plans."
  value       = element(concat(aws_iam_role.maf_aws_backup_role.*.unique_id, [""]), 0)
}

####
# Selection
####

output "selection_tag_ids" {
  description = "Backup Selection identifiers (by tags)."
  value       = compact(concat(aws_backup_selection.by_tags.*.id, [""]))
}
