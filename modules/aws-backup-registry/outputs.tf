####
# Vault
####

output "vault_id" {
  description = "The name of the vault."
  value       = aws_backup_vault.maf_vault.id
}

output "vault_arn" {
  description = "ARN of the vault."
  value       = aws_backup_vault.maf_vault.arn
}

output "vault_recovery_points" {
  description = "The number of recovery points that are stored in a backup vault."
  value       = aws_backup_vault.maf_vault.recovery_points
}

output "vault_kms_key_arn" {
  description = "ARN of the KMS key for the backup vault."
  value       = aws_kms_key.vault_key.arn
}

output "vault_kms_key_id" {
  description = "Globally unique identifier of the KMS key for the backup vault."
  value       = aws_kms_key.vault_key.key_id
}

####
# Plan
####

output "plan_arns" {
  description = "ARNs of the backup plans."
  value       = aws_backup_plan.maf_aws_backup_plan.arn
}

output "plan_versions" {
  description = "Unique, randomly generated, Unicode, UTF-8 encoded strings that serves as the version ID of the backup plans."
  value       = aws_backup_plan.maf_aws_backup_plan.version
}

output "plan_iam_role_arn" {
  description = "ARN of the role for the backup plans."
  value       = aws_iam_role.maf_aws_backup_role.arn
}

output "plan_iam_role_name" {
  description = "Name of the role for the backup plans."
  value       = aws_iam_role.maf_aws_backup_role.name
}

output "plan_iam_role_unique_id" {
  description = "Stable and unique string identifying the role for the backup plans."
  value       = aws_iam_role.maf_aws_backup_role.unique_id
}

####
# Selection
####

output "selection_tag_ids" {
  description = "Backup Selection identifiers (by tags)."
  value       = aws_backup_selection.selection_by_tags.id
}

output "selection_resource_ids" {
  description = "Backup Selection identifiers (by resources)."
  value       = aws_backup_selection.selection_by_resource.id
}

