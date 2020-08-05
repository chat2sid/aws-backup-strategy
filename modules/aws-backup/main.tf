#####
# Locals
#####

locals {
  tags = {
    "Terraform" = "true"
  }
}

####
# Vault
####

resource "aws_backup_vault" "maf_vault" {
  count = var.enabled && var.vault_create ? 1 : 0

  name        = var.vault_name
  kms_key_arn = var.vault_kms_key_create ? element(concat(aws_kms_key.maf_vault_key.*.arn, [""]), 0) : var.vault_kms_key_arn

  tags = merge(
    local.tags,
    var.tags,
    var.vault_tags,
    {
      "Name" = var.vault_name
    },
  )
}

resource "aws_kms_key" "maf_vault_key" {
  count = var.enabled && var.vault_create && var.vault_kms_key_create ? 1 : 0

  description = "KMS Key for '${var.vault_name}' vault encryption."

  tags = merge(
    local.tags,
    var.tags,
    var.vault_kms_tags,
    {
      "Name" = var.vault_kms_key_name
    },
  )
}

resource "aws_kms_alias" "maf_vault_key_alias" {
  count = var.enabled && var.vault_create && var.vault_kms_key_create ? 1 : 0

  name          = var.vault_kms_key_alias_name
  target_key_id = aws_kms_key.maf_vault_key[0].key_id
}

####
# Plan
####

resource "aws_backup_plan" "maf_aws_backup_plan" {
  count = var.enabled && var.plan_create ? 1 : 0

  name = var.plan_name

  rule {
    rule_name           = var.plan_rule_name
    target_vault_name   = var.vault_create ? element(concat(aws_backup_vault.maf_vault.*.name, [""]), 0) : var.vault_name
    schedule            = var.plan_rule_schedule
    start_window        = var.plan_rule_start_window
    completion_window   = var.plan_rule_completion_window
    recovery_point_tags = var.plan_rule_recovery_point_tags

    lifecycle {
      cold_storage_after = var.plan_rule_lifecycle_cold_storage_after
      delete_after       = var.plan_rule_lifecycle_delete_after
    }
  }

  tags = merge(
    local.tags,
    var.tags,
    var.plan_tags,
    {
      "Name" = var.plan_name
    },
  )
}

####
# Selection
####

data "aws_iam_policy_document" "maf_aws_backup_policy" {
  count = var.enabled && var.selection_create && var.selection_role_create ? 1 : 0

  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      identifiers = ["backup.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "maf_aws_backup_role" {
  count = var.enabled && var.selection_create && var.selection_role_create ? 1 : 0

  name               = var.selection_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.maf_aws_backup_policy[0].json
}

resource "aws_iam_role_policy_attachment" "maf_aws_backup_policy_attachment" {
  count = var.enabled && var.selection_create && var.selection_role_create ? 1 : 0

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.maf_aws_backup_role[0].name

  # NOTE: While this is ugly, without it we have a lot of failures with AWS. Probably a race condition.
  provisioner "local-exec" {
    command = "sleep 10"
  }
}

resource "aws_backup_selection" "by_tags" {
  count = var.enabled && var.selection_create && var.selection_by_tags ? 1 : 0

  iam_role_arn = var.selection_role_create ? element(concat(aws_iam_role.maf_aws_backup_role.*.arn, [""]), 0) : var.selection_role_arn
  name         = var.selection_tag_name
  plan_id      = var.plan_create ? element(concat(aws_backup_plan.maf_aws_backup_plan.*.id, [""]), 0) : var.selection_plan_id

  selection_tag {
    type  = var.selection_tag_type
    key   = var.selection_tag_key
    value = var.selection_tag_value
  }

  depends_on = [
    aws_backup_plan.maf_aws_backup_plan,
    aws_iam_role_policy_attachment.maf_aws_backup_policy_attachment
  ]

  # NOTE: While this is ugly, without it we have a lot of failures with AWS. Probably a race condition.
  provisioner "local-exec" {
    when    = destroy
    command = "sleep 10"
  }
}
