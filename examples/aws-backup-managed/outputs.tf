####
# Vault
####

output "vault_id" {
  value = module.default.vault_id
}

output "vault_arn" {
  value = module.default.vault_arn
}

output "vault_recovery_points" {
  value = module.default.vault_recovery_points
}

output "vault_kms_key_arn" {
  value = module.default.vault_kms_key_arn
}

output "vault_kms_key_id" {
  value = module.default.vault_kms_key_id
}

output "vault_kms_key_alias_arn" {
  value = module.default.vault_kms_key_alias_arn
}

####
# Plan
####

output "plan_arns" {
  value = module.default.plan_arns
}

output "plan_versions" {
  value = module.default.plan_versions
}

output "plan_iam_role_arn" {
  value = module.default.plan_iam_role_arn
}

output "plan_iam_role_name" {
  value = module.default.plan_iam_role_name
}

output "plan_iam_role_unique_id" {
  value = module.default.plan_iam_role_unique_id
}

####
# Selection
####

output "selection_tag_ids" {
  value = module.default.selection_tag_ids
}

output "selection_resources_ids" {
  value = module.default.selection_resources_ids
}
