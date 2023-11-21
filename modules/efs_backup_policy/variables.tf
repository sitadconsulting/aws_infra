variable "efs_backup_policy_file_system_id" {
  description = "The ID of the EFS file system"
  type        = string
}
variable "efs_backup_policy_backup_policy" {
  description = "A backup_policy object"
  type        = list(object({
    status = string
  }))
}
