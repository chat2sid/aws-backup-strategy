#####
# Module
#####

variable "enabled" {
  description = "Whether or not to enable this entire module or not."
  default     = true
}

variable "tags" {
  description = "Tags to be shared among all resources of this module."
  default     = {}
}

####
# Vault
####

variable "vault_create" {
  description = "Whether or not to create a vault for AWS Backup."
  default     = true
}

variable "vault_name" {
  description = "Name of the backup vault to use."
  default     = "default"
}

variable "vault_kms_key_arn" {
  description = "ARN of the KMS key to use for the vault for AWS Backup. Do not specify if you want to let the module create it own key."
  default     = null
  type        = string
}

variable "vault_kms_key_create" {
  description = "Whether or not to create a KMS key for the vault for AWS Backup."
  default     = true
}

variable "vault_kms_key_name" {
  description = "Name of the KMS key to use for the vault for AWS Backup."
  default     = ""
}

variable "vault_kms_key_alias_name" {
  description = "Alias for the KMS key of the Backup vault. Will be merged with tags."
  default     = ""
}

variable "vault_tags" {
  description = "Tags for the Backup vault. Will be merged with tags."
  default     = {}
}

variable "vault_kms_tags" {
  description = "Tags for the KMS key of the Backup vault. Will be merged with tags."
  default     = {}
}

####
# Plan
####

variable "plan_create" {
  description = "Whether or not to create a plan."
  default     = true
}

variable "plan_name" {
  description = "Name of the plan."
  default     = "backup-plan"
}

variable "plan_rule_name" {
  description = "Name of the rule for the plan."
  default     = "backup-rule"
}

variable "plan_rule_schedule" {
  description = "A CRON expression specifying when to initiates a backup job for the plan."
  default     = ""
}

variable "plan_rule_start_window" {
  description = "The amount of time in minutes before beginning a backup for the plan."
  default     = ""
}

variable "plan_rule_completion_window" {
  description = "The amount of time AWS Backup attempts a backup before canceling the job and returning an error for the plan."
  default     = ""
}

variable "plan_rule_recovery_point_tags" {
  description = "Metadata that you can assign to help organize the resources that you create for the plan."
  default     = {}
}

variable "plan_rule_lifecycle_cold_storage_after" {
  description = "Specifies the number of days after creation that a recovery point is moved to cold storage."
  default     = ""
}

variable "plan_rule_lifecycle_delete_after" {
  description = "Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after."
  default     = ""
}

variable "plan_tags" {
  description = "Tags for the Backup plan. Will be merged with tags."
  default     = {}
}

####
# Selection
####

variable "selection_role_create" {
  description = "Whether or not to create a role for selection."
  default     = true
}

variable "selection_iam_role_name" {
  description = "Name of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource."
  default     = "BackupRole"
}

variable "selection_role_arn" {
  description = "ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource. Must be specified if selection_role_create is false."
  default     = ""
}

variable "selection_create" {
  description = "Whether or not to create a selection."
  default     = true
}

variable "selection_by_tags" {
  description = "Whether or not to create a selection by tags."
  default     = false
}

<<<<<<< HEAD
=======
variable "selection_by_ressources" {
  description = "Whether or not to create a selection by resources."
  default     = false
}

>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
variable "selection_tag_name" {
  description = "Name of the selection by tags."
  default     = "selection-by-tag"
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
  default     = "1"
}

variable "selection_plan_id" {
  description = "The backup plan ID to be associated with the selection of resources. Must be specified if plan_create is false."
  default     = ""
}

<<<<<<< HEAD
=======
variable "selection_resource_name" {
  description = "Name of the selection by resource."
  default     = "selection-by-resource"
}

variable "selection_resources" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan."
  default     = []
}
>>>>>>> 6639311824aab204b98dbb93adaa398197375c8d
