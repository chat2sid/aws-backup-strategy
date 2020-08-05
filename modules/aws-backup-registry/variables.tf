####
# Vault
####

variable "vault_name" {
  description = "Name of the backup vault to use."
  default     = "backup-vault"
}

variable "vault_kms_key_name" {
  description = "Name of the KMS key to use for the vault for AWS Backup."
  default     = "vault-kms-key"
}

####
# Plan
####

variable "backup_plan_name" {
  description = "Name of the plan."
  default     = "backup-plan"
}

variable "backup_rule_name" {
  description = "Name of the rule for the plan."
  default     = "backup-rule"
}

variable "backup_cron_schedule" {
  description = "A CRON expression specifying when to initiates a backup job for the plan."
  default     = ""
}

variable "rule_start_window" {
  description = "The amount of time in minutes before beginning a backup for the plan."
  default     = ""
}

variable "rule_completion_window" {
  description = "The amount of time AWS Backup attempts a backup before canceling the job and returning an error for the plan."
  default     = ""
}

variable "rule_recovery_point_tags" {
  description = "The amount of time in minutes before beginning a backup for the plan."
  default     = ""
}

variable "cold_storage_after_days" {
  description = "Specifies the number of days after creation that a recovery point is moved to cold storage."
  default     = ""
}

variable "delete_after_days" {
  description = "Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after."
  default     = ""
}

####
# Selection
####

variable "backuprole_name" {
  description = "Name of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource."
  default     = "BackupRole"
}

variable "selection_tag_type" {
  description = "An operation, such as 'StringEquals', that is applied to a key-value pair used to filter resources in a selection."
  default     = "STRINGEQUALS"
}

variable "selection_tag_key" {
  description = "The key in a key-value pair of the selection by tags."
  default     = "Backup"
}

variable "selection_tag_value" {
  description = "The value in a key-value pair of the selection by tags."
  default     = "yes"
}

variable "selection_resources" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan."
  default     = []
}
