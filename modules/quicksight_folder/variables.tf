variable "quicksight_folder_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_folder_folder_id" {
  description = "Identifier for the folder"
  type        = string
}
variable "quicksight_folder_folder_type" {
  description = "The type of folder. By default, it is SHARED. Valid values are: SHARED"
  type        = string
  default     = ""
}
variable "quicksight_folder_name" {
  description = "Display name for the folder"
  type        = string
}
variable "quicksight_folder_parent_folder_arn" {
  description = "ARN for the parent folder. If not set, creates a root-level folder"
  type        = string
  default     = ""
}
variable "quicksight_folder_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "quicksight_folder_permissions" {
  description = "A set of resource permissions on the folder. Maximum of 64 items"
  type        = list(object({
    actions   = list(string)
    principal = string
  }))
  default     = []
}
