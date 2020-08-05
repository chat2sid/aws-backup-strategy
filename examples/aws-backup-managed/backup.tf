/*
provider "aws" {
  version    = "~> 2.19.0"
  region     = "eu-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}
*/
resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

resource "aws_ebs_volume" "example" {
  availability_zone = "eu-west-2a"
  size              = 2

  tags = {
    Name = "tftest"
  }
}

module "default" {
  source = "../modules/aws-backup/"

  enabled = true

  tags = {
    Name = "toBeOverriden"
  }

  ####
  # Vault
  ####

  vault_create             = true
  vault_name               = "tftest${random_string.this.result}Vault"
  vault_kms_key_name       = "tftest${random_string.this.result}KMSKeyName"
  vault_kms_key_alias_name = "alias/tftest/${random_string.this.result}"
  vault_tags = {
    Name = "tftest"
  }
  vault_kms_tags = {
    Name = "tftest"
  }

  ####
  # Plan
  ####

  plan_create                 = true
  plan_name                   = "tftest${random_string.this.result}Plan"
  plan_rule_name              = "tftest${random_string.this.result}Rule"
  plan_rule_schedule          = "cron(0 12 * * ? *)"
  plan_rule_start_window      = "60"
  plan_rule_completion_window = "120"
  plan_rule_recovery_point_tags = {
    Name = "tftest"
  }
  plan_rule_lifecycle_cold_storage_after = "30"
  plan_rule_lifecycle_delete_after       = "365"
  plan_tags = {
    Name = "tftest"
  }

  ####
  # Selection
  ####

  selection_role_create   = true
  selection_iam_role_name = "tftest${random_string.this.result}Role"
  selection_create        = true
  selection_by_tags       = true
  selection_by_ressources = true
  selection_tag_name      = "tftest${random_string.this.result}SelectionTag"
  selection_tag_key       = "Backup"
  selection_tag_value     = 1
  selection_resource_name = "tftest${random_string.this.result}SelectionResource"
  selection_resources = [
    aws_ebs_volume.example.arn,
  ]
}
