
module "backup" {
  source  = "../../modules/aws-backup-registry/"

  ####
  # Vault
  ####

  vault_name               = "maf-aws-backup-Vault"
  
  ####
  # Plan
  ####

  plan_name                   = "maf-aws-backup-Plan"
  plan_rule_name              = "maf-aws-backup-Rule"
  plan_rule_schedule          = "cron(0 12 * * ? *)"
  plan_rule_start_window      = "60"
  plan_rule_completion_window = "120"
  plan_rule_recovery_point_tags = {
    Name = "maf-aws-backup"
  }
  plan_rule_lifecycle_cold_storage_after = "30"
  plan_rule_lifecycle_delete_after       = "365"

  ####
  # Selection
  ####

  selection_role_create   = true
  selection_iam_role_name = "maf-aws-backup-Role"
  selection_create        = true
  selection_by_tags       = true
  selection_tag_name      = "maf-aws-backup-SelectionTag"
  selection_tag_key       = "Backup"
  selection_tag_value     = 1
}
