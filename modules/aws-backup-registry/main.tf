resource "aws_backup_vault" "maf_vault" {
  name        = var.vault_name
  kms_key_arn = aws_kms_key.vault_key.arn
}

resource "aws_kms_key" "vault_key" {
  description             = "KMS key For Backup Vault"
}

resource "aws_backup_plan" "maf_aws_backup_plan" {
  name = var.backup_plan_name

  rule {
    rule_name         = var.backup_rule_name
    target_vault_name = aws_backup_vault.maf_vault.name
    schedule          = var.backup_cron_schedule
    start_window        = var.rule_start_window
    completion_window   = var.rule_completion_window
    recovery_point_tags = var.rule_recovery_point_tags
    lifecycle {
        cold_storage_after = var.cold_storage_after_days
        delete_after = var.delete_after_days
    }
  }
}

resource "aws_iam_role" "maf_aws_backup_role" {
  name               = var.backup_role_name
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "maf_aws_backup_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.maf_aws_backup_role.name
}

resource "aws_backup_selection" "selection_by_tags" {
  iam_role_arn = aws_iam_role.maf_aws_backup_role.arn
  name         = selectionbytag
  plan_id      = aws_backup_plan.maf_aws_backup_plan.id

  selection_tag {
    type  = var.selection_tag_type
    key   = var.selection_tag_key
    value = var.selection_tag_value
  }
}

resource "aws_backup_selection" "selection_by_resource" {
  iam_role_arn = aws_iam_role.maf_aws_backup_role.arn
  name         = selectionbyresource
  plan_id      = aws_backup_plan.maf_aws_backup_plan.id

  resources = var.resource_selection_names
}
