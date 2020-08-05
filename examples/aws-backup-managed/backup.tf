<<<<<<< HEAD
module "default" {
  source = "../../modules/aws-backup/"
=======
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
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d

  enabled = true

  tags = {
    Name = "toBeOverriden"
  }

  ####
  # Vault
  ####

  vault_create             = true
<<<<<<< HEAD
  vault_name               = "maf-aws-backup-Vault"
  vault_kms_key_name       = "maf-aws-backup-KMSKeyName"
  vault_kms_key_alias_name = "alias/maf-aws-backup/"
  vault_tags = {
    Name = "maf-aws-backup"
  }
  vault_kms_tags = {
    Name = "maf-aws-backup"
=======
  vault_name               = "tftest${random_string.this.result}Vault"
  vault_kms_key_name       = "tftest${random_string.this.result}KMSKeyName"
  vault_kms_key_alias_name = "alias/tftest/${random_string.this.result}"
  vault_tags = {
    Name = "tftest"
  }
  vault_kms_tags = {
    Name = "tftest"
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
  }

  ####
  # Plan
  ####

  plan_create                 = true
<<<<<<< HEAD
  plan_name                   = "maf-aws-backup-Plan"
  plan_rule_name              = "maf-aws-backup-Rule"
=======
  plan_name                   = "tftest${random_string.this.result}Plan"
  plan_rule_name              = "tftest${random_string.this.result}Rule"
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
  plan_rule_schedule          = "cron(0 12 * * ? *)"
  plan_rule_start_window      = "60"
  plan_rule_completion_window = "120"
  plan_rule_recovery_point_tags = {
<<<<<<< HEAD
    Name = "maf-aws-backup"
=======
    Name = "tftest"
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
  }
  plan_rule_lifecycle_cold_storage_after = "30"
  plan_rule_lifecycle_delete_after       = "365"
  plan_tags = {
<<<<<<< HEAD
    Name = "maf-aws-backup"
=======
    Name = "tftest"
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
  }

  ####
  # Selection
  ####

  selection_role_create   = true
<<<<<<< HEAD
  selection_iam_role_name = "maf-aws-backup-Role"
  selection_create        = true
  selection_by_tags       = true
  selection_tag_name      = "maf-aws-backup-SelectionTag"
  selection_tag_key       = "Backup"
  selection_tag_value     = 1
=======
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
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
}
