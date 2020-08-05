####
# Vault
####

output "vault_id" {
  value = module.backup.vault_id
}

output "vault_arn" {
  value = module.backup.vault_arn
}

output "vault_recovery_points" {
  value = module.backup.vault_recovery_points
}

output "vault_kms_key_arn" {
  value = module.backup.vault_kms_key_arn
}

output "vault_kms_key_id" {
  value = module.backup.vault_kms_key_id
}

output "vault_kms_key_alias_arn" {
  value = module.backup.vault_kms_key_alias_arn
}

####
# Plan
####

output "plan_arns" {
  value = module.backup.plan_arns
}

output "plan_versions" {
  value = module.backup.plan_versions
}

output "plan_iam_role_arn" {
  value = module.backup.plan_iam_role_arn
}

output "plan_iam_role_name" {
  value = module.backup.plan_iam_role_name
}

output "plan_iam_role_unique_id" {
  value = module.backup.plan_iam_role_unique_id
}

####
# Selection
####

output "selection_tag_ids" {
  value = module.backup.selection_tag_ids
}
