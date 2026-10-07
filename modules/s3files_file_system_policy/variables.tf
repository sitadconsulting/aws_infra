variable "s3files_file_system_policy_file_system_id" {
  description = "(Required) File system ID. Changing this value forces replacement"
  type        = string
}
variable "s3files_file_system_policy_policy" {
  description = "(Required) JSON policy document"
  type        = string
}
