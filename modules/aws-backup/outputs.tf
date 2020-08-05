####
# Vault
####

output "vault_id" {
  description = "The name of the vault."
<<<<<<< HEAD
  value       = element(concat(aws_backup_vault.maf_vault.*.id, [""]), 0)
=======
  value       = element(concat(aws_backup_vault.this.*.id, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "vault_arn" {
  description = "ARN of the vault."
<<<<<<< HEAD
  value       = element(concat(aws_backup_vault.maf_vault.*.arn, [""]), 0)
=======
  value       = element(concat(aws_backup_vault.this.*.arn, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "vault_recovery_points" {
  description = "The number of recovery points that are stored in a backup vault."
<<<<<<< HEAD
  value       = element(concat(aws_backup_vault.maf_vault.*.recovery_points, [""]), 0)
=======
  value       = element(concat(aws_backup_vault.this.*.recovery_points, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "vault_kms_key_arn" {
  description = "ARN of the KMS key for the backup vault."
<<<<<<< HEAD
  value       = element(concat(aws_kms_key.maf_vault_key.*.arn, [""]), 0)
=======
  value       = element(concat(aws_kms_key.this.*.arn, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "vault_kms_key_id" {
  description = "Globally unique identifier of the KMS key for the backup vault."
<<<<<<< HEAD
  value       = element(concat(aws_kms_key.maf_vault_key.*.key_id, [""]), 0)
=======
  value       = element(concat(aws_kms_key.this.*.key_id, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "vault_kms_key_alias_arn" {
  description = "ARN of the KMS key alias for the backup vault."
<<<<<<< HEAD
  value       = element(concat(aws_kms_alias.maf_vault_key_alias.*.arn, [""]), 0)
=======
  value       = element(concat(aws_kms_alias.this.*.arn, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

####
# Plan
####

output "plan_arns" {
  description = "ARNs of the backup plans."
<<<<<<< HEAD
  value       = compact(concat(aws_backup_plan.maf_aws_backup_plan.*.arn, [""]))
=======
  value       = compact(concat(aws_backup_plan.this.*.arn, [""]))
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "plan_versions" {
  description = "Unique, randomly generated, Unicode, UTF-8 encoded strings that serves as the version ID of the backup plans."
<<<<<<< HEAD
  value       = compact(concat(aws_backup_plan.maf_aws_backup_plan.*.version, [""]))
=======
  value       = compact(concat(aws_backup_plan.this.*.version, [""]))
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "plan_iam_role_arn" {
  description = "ARN of the role for the backup plans."
<<<<<<< HEAD
  value       = element(concat(aws_iam_role.maf_aws_backup_role.*.arn, [""]), 0)
=======
  value       = element(concat(aws_iam_role.this.*.arn, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "plan_iam_role_name" {
  description = "Name of the role for the backup plans."
<<<<<<< HEAD
  value       = element(concat(aws_iam_role.maf_aws_backup_role.*.name, [""]), 0)
=======
  value       = element(concat(aws_iam_role.this.*.name, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

output "plan_iam_role_unique_id" {
  description = "Stable and unique string identifying the role for the backup plans."
<<<<<<< HEAD
  value       = element(concat(aws_iam_role.maf_aws_backup_role.*.unique_id, [""]), 0)
=======
  value       = element(concat(aws_iam_role.this.*.unique_id, [""]), 0)
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}

####
# Selection
####

output "selection_tag_ids" {
  description = "Backup Selection identifiers (by tags)."
  value       = compact(concat(aws_backup_selection.by_tags.*.id, [""]))
}
<<<<<<< HEAD
=======

output "selection_resources_ids" {
  description = "Backup Selection identifiers (by ressources)."
  value       = compact(concat(aws_backup_selection.by_resources.*.id, [""]))
}
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
