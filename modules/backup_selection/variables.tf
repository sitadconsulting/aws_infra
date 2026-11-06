variable "backup_selection_iam_role_arn" {
  description = "(Required) ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource"
  type        = string
}
variable "backup_selection_name" {
  description = "(Required) Display name of a resource selection document"
  type        = string
}
variable "backup_selection_not_resources" {
  description = "(Optional) Array of strings that either contain ARNs or match patterns of resources to exclude from a backup plan"
  type        = list(string)
  default     = null
}
variable "backup_selection_plan_id" {
  description = "(Required) Backup plan ID to be associated with the selection of resources"
  type        = string
}
variable "backup_selection_resources" {
  description = "(Optional) Array of strings that either contain ARNs or match patterns of resources to assign to a backup plan"
  type        = list(string)
  default     = null
}
variable "backup_selection_condition" {
  description = "(Optional) Condition-based filters used to specify sets of resources for a backup plan"
  type        = list(object({
    string_equals     = optional(list(object({
      key   = string
      value = string
    })), [])
    string_like       = optional(list(object({
      key   = string
      value = string
    })), [])
    string_not_equals = optional(list(object({
      key   = string
      value = string
    })), [])
    string_not_like   = optional(list(object({
      key   = string
      value = string
    })), [])
  }))
  default     = []
}
variable "backup_selection_selection_tag" {
  description = "(Optional) Tag-based conditions used to specify a set of resources to assign to a backup plan"
  type        = list(object({
    key   = string
    type  = string
    value = string
  }))
  default     = []
}
